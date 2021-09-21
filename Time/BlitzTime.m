//
//  NTPServer.m
//  BlitzBi
//
//  Created by Admin on 12/11/20.
//

#import "BlitzTime.h"

#import "BlitzTimeTypes.h"

#import <arpa/inet.h>
#import <assert.h>
#import <netdb.h>
#import <sys/time.h>
#import "BlitzBiService.h"
#import "BlitzLogger.h"

@interface BlitzTime() {
    NSTimeInterval _timeout;
    NSTimeInterval _offset;
    dispatch_queue_t serialQueue;
    NSUInteger _port;
    int _socket;
    NSInteger ntpIndex;
    BOOL connected;
    BOOL isSerialQueueJobSubmitted;
    BOOL isBlitzServerEpochTimeJobSubmitted;
    NSArray<NSString *> *blitzSyncNtpServers;
}
- (BOOL)areAllNTPServerFetched;
@end

@implementation BlitzTime

//! The number of seconds from 1900 to 1970
static const uint32_t kSecondsFrom1900To1970 = 2208988800UL;

//! Returns the local time as an NTP ufixed64 timestamp
static ufixed64_t ntp_localtime_get_ufixed64() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return ufixed64((uint32_t)tv.tv_sec + kSecondsFrom1900To1970, tv.tv_usec * (pow(2, 32) / USEC_PER_SEC));
}

- (instancetype)init {
    if (self = [super init]) {
        _port = 123;
        _timeout = 1.0;
        _socket = -1;
        _offset = NAN;
        serialQueue = dispatch_queue_create([@"bi_events_time_serial" UTF8String], DISPATCH_QUEUE_SERIAL);
        blitzSyncNtpServers = [[NSArray alloc] initWithObjects:@"time.apple.com", @"time.google.com", @"time.cloudflare.com", @"time.facebook.com", @"time.windows.com", @"time.nist.gov", nil];
        ntpIndex = 0;
    }
    return self;
}

- (void)dealloc {
    [self disconnect];
}

- (void)setTimeout:(NSTimeInterval)timeout {
    assert(timeout > 0 && isfinite(timeout));
    @synchronized (self) {
        _timeout = timeout;
        if (_socket >= 0) {
            struct timeval tv = { .tv_sec = _timeout, .tv_usec = (_timeout - trunc(_timeout)) * USEC_PER_SEC };
            setsockopt(_socket, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
            setsockopt(_socket, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
            int value = 1;
            setsockopt(_socket, SOL_SOCKET, SO_NOSIGPIPE, &value, sizeof(value));
            
        }
        
    }
}

- (NSTimeInterval)timeout {
    @synchronized (self) {
        return _timeout;
    }
}

- (BOOL)isConnected {
    @synchronized (self) {
        return _socket >= 0;
    }
}

- (BOOL)connectWithError:(NSError *__autoreleasing _Nullable *_Nullable)error {
    @synchronized (self) {
        if ([self areAllNTPServerFetched]) {
            return NO;
        }
        NSString *hostname = [blitzSyncNtpServers objectAtIndex:ntpIndex];
        if (_socket >= 0) {
            return YES;
        }
        
        // setup hints.
        struct addrinfo hints = {0}, *addrinfo = NULL, *addr = NULL;
        hints.ai_family = AF_UNSPEC; // getaddrinfo will resolve (AF_INET or AF_INET6)
        hints.ai_socktype = SOCK_DGRAM; // UDP
        
        // get port string.
        NSString *port = [[NSString alloc] initWithFormat:@"%lu", (unsigned long) _port];
        
        // get address info.
        int getaddrinfo_err = getaddrinfo(hostname.UTF8String, port.UTF8String, &hints, &addrinfo);
        if (getaddrinfo_err != 0) {
            if (error) {
                NSString *errorDescription = [[NSString alloc] initWithUTF8String:gai_strerror(getaddrinfo_err)];
                NSDictionary *errorInfo = [[NSDictionary alloc] initWithObjectsAndKeys:errorDescription, NSLocalizedDescriptionKey, nil];
                *error = [NSError errorWithDomain:@"netdb" code:getaddrinfo_err userInfo:errorInfo];
            }
            return NO;
        }
        
        if (addrinfo) {
            for (addr = addrinfo; addr; addr = addr->ai_next) {
                char host[NI_MAXHOST];
                getnameinfo(addr->ai_addr, addr->ai_addrlen, host, sizeof(host), NULL, 0, NI_NUMERICHOST);
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Fetched port %s for hostname %@", host, hostname]];
            }
        }
        
        // create the socket.
        const int sock = socket(addrinfo->ai_family, addrinfo->ai_socktype, addrinfo->ai_protocol);
        if (sock < 0) {
            if (error) {
                *error = [NSError errorWithDomain:NSPOSIXErrorDomain code:errno userInfo:nil];
            }
            freeaddrinfo(addrinfo);
            return NO;
        }
        
        // set nonblocking.
        fcntl(sock, F_SETFL, fcntl(sock, F_GETFL, 0) | O_NONBLOCK);
        
        // connect async with timeout.
        struct timeval timeout = { .tv_sec = _timeout, .tv_usec = (_timeout - trunc(_timeout)) * USEC_PER_SEC };
        int connect_err = connect(sock, addrinfo->ai_addr, addrinfo->ai_addrlen) ? errno : 0;
        if (connect_err == EINPROGRESS) {
            fd_set fd;
            FD_ZERO(&fd);
            FD_SET(sock, &fd);
            
            const int select_err = select(sock + 1, &fd, &fd, NULL, &timeout);
            if (select_err <= 0) {
                connect_err = select_err ? errno : ETIMEDOUT;
            } else {
                socklen_t optlen = sizeof(connect_err);
                getsockopt(sock, SOL_SOCKET, SO_ERROR, &connect_err, &optlen);
            }
        }
        freeaddrinfo(addrinfo);
        if (connect_err) {
            if (error) {
                *error = [NSError errorWithDomain:NSPOSIXErrorDomain code:connect_err userInfo:nil];
            }
            close(sock);
            return NO;
        }
        
        // set blocking.
        fcntl(sock, F_SETFL, fcntl(sock, F_GETFL, 0) & ~O_NONBLOCK);
        
        // set timeout.
        setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout));
        setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
        int value = 1;
        setsockopt(sock, SOL_SOCKET, SO_NOSIGPIPE, &value, sizeof(value));
        
        [self willChangeValueForKey:@"connected"];
        _socket = sock;
        [self didChangeValueForKey:@"connected"];
        
        return YES;
    }
}

- (void)disconnect {
    @synchronized (self) {
        if (_socket >= 0) {
            close(_socket);
            
            [self willChangeValueForKey:@"connected"];
            _socket = -1;
            [self didChangeValueForKey:@"connected"];
        }
    }
}

- (BOOL)syncWithError:(NSError *__autoreleasing _Nullable *_Nullable)error {
    @synchronized (self) {
        if (![self connectWithError:error]) {
            if (![self areAllNTPServerFetched]) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Fetched time failed for %@", [self->blitzSyncNtpServers objectAtIndex:self->ntpIndex]]];
            }
            self->isSerialQueueJobSubmitted = NO;
            self->ntpIndex = self->ntpIndex + 1;
            return NO;
        }
        
        // setup NTP packet.
        ntp_packet_t packet = {0};
        packet.version_number = 4; // NTPv4.
        packet.mode = 3; // client mode.
        packet.transmit_timestamp = ntp_localtime_get_ufixed64(); // client transmit time.
        
        // convert to network byte order.
        packet = hton_ntp_packet(packet);
        
        // send packet to server.
        const ssize_t send_s = send(_socket, &packet, sizeof(packet), 0);
        const int send_err = send_s == sizeof(packet) ? 0 : send_s >= 0 ? EIO : errno;
        if (send_err) {
            if (error) {
                *error = [NSError errorWithDomain:NSPOSIXErrorDomain code:send_err userInfo:nil];
            }
            if (![self areAllNTPServerFetched]) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Fetched time failed for %@", [self->blitzSyncNtpServers objectAtIndex:self->ntpIndex]]];
            }
            [self disconnect];
            self->isSerialQueueJobSubmitted = NO;
            self->ntpIndex = self->ntpIndex + 1;
            return NO;
        }
        
        // receive packet from server.
        const ssize_t recv_s = recv(_socket, &packet, sizeof(packet), 0);
        const int recv_err = recv_s == sizeof(packet) ? 0 : recv_s >= 0 ? EIO : errno;
        if (recv_err) {
            if (error) {
                *error = [NSError errorWithDomain:NSPOSIXErrorDomain code:recv_err userInfo:nil];
            }
            if (![self areAllNTPServerFetched]) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Fetched time failed for %@", [self->blitzSyncNtpServers objectAtIndex:self->ntpIndex]]];
            }
            [self disconnect];
            self->isSerialQueueJobSubmitted = NO;
            self->ntpIndex = self->ntpIndex + 1;
            return NO;
        }
        
        // convert to host byte order.
        packet = ntoh_ntp_packet(packet);
        
        // calculate and update host delay.
        const double T[4] = {
            ufixed64_as_double(packet.originate_timestamp), // client transmit time.
            ufixed64_as_double(packet.receive_timestamp), // server receive time.
            ufixed64_as_double(packet.transmit_timestamp), // server transmit time.
            ufixed64_as_double(ntp_localtime_get_ufixed64()), // client receive time.
        };
        _offset = ((T[1] - T[0]) + (T[2] - T[3])) / 2.0;
        if (![self areAllNTPServerFetched]) {
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Fetched time success for %@", [self->blitzSyncNtpServers objectAtIndex:self->ntpIndex]]];
        }
        self->isSerialQueueJobSubmitted = NO;
        return YES;
    }
}

- (BOOL)areAllNTPServerFetched {
    return ntpIndex >= blitzSyncNtpServers.count;
}

- (void)setOffset:(NSTimeInterval)offset {
    self->_offset = offset;
}

- (nullable NSDate *)dateWithError:(NSError *__autoreleasing _Nullable *_Nullable)error {
    @synchronized (self) {
        if (isfinite(_offset)) {
            return [NSDate dateWithTimeIntervalSinceNow:_offset];
        }
        else if (![self areAllNTPServerFetched]) {
            if (!isSerialQueueJobSubmitted) {
                if (![self areAllNTPServerFetched]) {                   
                    [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Fetching time for %@", [self->blitzSyncNtpServers objectAtIndex:self->ntpIndex]]];
                }
                self->isSerialQueueJobSubmitted = YES;
                dispatch_async(serialQueue, ^{
                    [self syncWithError:nil];
                });
            }
        }
        else {
            if (!isBlitzServerEpochTimeJobSubmitted) {
                [BlitzLogger logMessage:@"[BlitzBi][Time] Fetching time for BlitzBi Server"];
                isBlitzServerEpochTimeJobSubmitted = YES;
                [[BlitzBiService sharedService] getTimeStamp];
            }
        }
        return nil;
    }
}

@end
