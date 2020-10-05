//
//  BiEventSendHandler.swift
//  ArVideoDemo
//
//  Created by Nitin on 12/03/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

public protocol PBlitzBiEventSendHandler {
    func flush(onEmergency eventDict: [String : Any]?)
    func sendEvent(_ eventDict: [String : Any]?, withForcedFlush isForced: Bool)
    func sendEvents(_ events: [[String : Any]]?)
}

class BlitzBiEventSendHandler:NSObject, PBlitzBiEventSendHandler {
    let COMMON_FIELD_3 = "common_field_3"
    let FILE_NAME = "filename"

    let FLUSH_AFTER_APP_PARAM_KEY = "bi_flush_after_secs"
    let MAX_BATCH_SIZE_APP_PARAM_KEY = "bi_max_batch_size"
    var maxPendingCount = 200
    var forceSendAfterSeconds = 30
    let EVENTS_FILE_PATH = "bi-events.plist"
    var biConfig: BlitzBiConfig?

    private var serialQueue: DispatchQueue?
    private var networkQueue: DispatchQueue?
    var pendingEvents: [[String : Any]]?
    private var biEventFireTimer: Timer?
    private var nextFlushTime: TimeInterval = 0.0
    private var isBlockSubmittedToNetworkQueue = false
    private var eventRepository:IBlitzBIEventRepository
    
    public init(batchSize:Int, baseUrl: String?, eventsUrl: String?, biEventsDirectUrl: String?,eventRepository:IBlitzBIEventRepository ) {
        self.eventRepository = eventRepository
        super.init()
        self.setBatchSize(batchSize)
        biConfig = BlitzBiConfig()
        biConfig?.base_URL = baseUrl
        biConfig?.events_SERVER_URL = eventsUrl
        biConfig?.bi_EVENTS_SERVER_DIRECT_URL = biEventsDirectUrl
        let serialLabel = "bi_events_sender_serial"
        serialQueue = DispatchQueue(label: serialLabel)
        let networkLabel = "bi_events_sender_network"
        networkQueue = DispatchQueue(label: networkLabel)
        isBlockSubmittedToNetworkQueue = false

        pendingEvents = []
        let nextDate = Date(timeIntervalSinceNow: TimeInterval(forceSendAfterSeconds))
        nextFlushTime = nextDate.timeIntervalSince1970
        unarchiveEvents()
        self.addNotification()
    }
    
    private func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onStart), name:
            UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onPause), name:
            UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onResume), name:
            UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onStop),name:
            UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDestroy),name:
            UIApplication.willTerminateNotification, object: nil)
    }
    
    @objc func onStart() {
        
    }
    
    @objc func onPause() {
        startRepeatedTimerToAttemptFlush();
    }

    @objc func onResume() {
        invalidateTimer();
    }
    
    @objc func onStop() {
        
    }
    
    @objc func onDestroy() {
        
    }

    @objc private func startRepeatedTimerToAttemptFlush() {
        DispatchQueue.main.async(execute: { [self] in
            self.biEventFireTimer?.invalidate()
            self.biEventFireTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.forceSendAfterSeconds), target: self, selector: #selector(self.timerTicked), userInfo: nil, repeats: true)
        })
    }

    @objc private func invalidateTimer() {
        DispatchQueue.main.async(execute: { [self] in
            self.biEventFireTimer?.invalidate()
        })
    }

    @objc private func timerTicked() {
        print("[BI] timer ticked")
        flush(withIsForced: true)
    }

    public func flush(onEmergency eventDict: [String : Any]?) {
        let eventDict = eventDict
        print("[BI] flushing all the events immediately without any response tracking")
        if eventDict != nil {
            //eventDict = eventDict    // Skipping redundant initializing to itself
        }
        var eventsCopy: [[String:Any]]?
        let lockQueue = DispatchQueue(label: "self")
        lockQueue.sync {
            if let eventDict = eventDict {
                pendingEvents?.append(eventDict)
            }
            eventsCopy = pendingEvents
        }
        while (eventsCopy?.count ?? 0) > 0 {
            let batchSize = Int(min(eventsCopy?.count ?? 0, maxPendingCount))
            let batch = Array<[String:Any]>(eventsCopy?[0...batchSize] ?? [])
            //(eventsCopy as NSArray?)?.subarray(with: NSRange(location: 0, length: batchSize))

            let jsonData = getJSONData(forBatch: batch)
            let url = biConfig?.events_SERVER_URL

            eventRepository.processJsonRequestWithoutResponse(url:url ?? "", body: jsonData, isEmergency: true)
            eventsCopy = self.removeFromOneArrayIfPresentInOther(first: eventsCopy ?? [[:]], second: batch)
        }
    }

    public func sendEvents(_ events: [[String : Any]]?) {
        sendEvents(events, withForcedFlush: false)
    }

    public func sendEvent(_ eventDict: [String : Any]?, withForcedFlush isForced: Bool) {
        sendEvents([(eventDict ?? [:])], withForcedFlush: isForced)
    }

    private func sendEvents(_ events: [[String : Any]]?, withForcedFlush isForced: Bool) {
        var eventsCopy: [[String:Any]] = []
        for event in events ?? [] {
            let eventName = event[EVENT_NAME_TAG] as? String
            if eventName == nil || (eventName?.count ?? 0) == 0 {
                if config?.isDebugEnabled() == true {
                    assert(false, "Event name is absent.")
                }
            } else {
                eventsCopy.append(event)
            }
        }

        serialQueue?.async(execute: { [self] in
            let lockQueue = DispatchQueue(label: "self")
            lockQueue.sync {
                self.pendingEvents?.append(contentsOf: eventsCopy)
               // pendingEvents?.addObjects(fromArray: eventsCopy)
            }
            self.archiveEvents()
            let shouldFlush = self.shouldFlushEvents() || isForced
            if shouldFlush {
                if !self.isBlockSubmittedToNetworkQueue {
                    self.isBlockSubmittedToNetworkQueue = true
                    self.networkQueue?.async(execute: self.checkAndFlushAndArchiveBlock(isForced))
                }
            }
        })
    }

    private func checkAndFlushAndArchiveBlock(_ isForced: Bool) -> () -> Void {
        return { [self] in
            let shouldArchive = self.checkAndFlush(withIsForced: isForced)
            if shouldArchive {
                self.archiveEvents()
            }
        }
    }

    private func flush(withIsForced isForced: Bool) {
        serialQueue?.async(execute: { [self] in
            let shouldFlush = self.shouldFlushEvents() || isForced
            if shouldFlush {
                if !self.isBlockSubmittedToNetworkQueue {
                    self.isBlockSubmittedToNetworkQueue = true
                    self.networkQueue?.async(execute: self.checkAndFlushAndArchiveBlock(isForced))
                }
            }
        })
    }

    private func checkAndFlush(withIsForced isForced: Bool) -> Bool {
        do {
            let shouldFlush = try shouldFlushEvents()
            if !isForced && !shouldFlush {
                return false
            }
            updateNextFlushTime()
            var eventsCopy: [[String:Any]]?
            let lockQueue = DispatchQueue(label: "self")
            lockQueue.sync {
                eventsCopy = pendingEvents
            }
            print(String(format: "[BI] sending all the events with count %lu with blocking response tracking", eventsCopy?.count ?? 0))
            while (eventsCopy?.count ?? 0) > 0 {
                let batchSize = Int(min(eventsCopy?.count ?? 0, maxPendingCount))
                let batch = Array<[String:Any]>(eventsCopy?[0..<batchSize] ?? [])
                var didFail = false
                    if JSONSerialization.isValidJSONObject(batch) {
                        let jsonData = getJSONData(forBatch: batch)
                        let url = biConfig?.events_SERVER_URL

                        let semaphore = DispatchSemaphore(value: 0)

                        eventRepository.processJsonRequest(url:url ?? "", data: jsonData, completionHandler: { [self] response, err in
                            var success = false
                            if let data = response {
                                success = data.status.uppercased() == "SUCCESS"
                            }
                            if err != nil || !success {
                                didFail = true
                                //Send error to crashlytics
                                if let jsonData = jsonData, let err = err {
                                    print("Error in getting response from server for jsondata \(jsonData) with error \(err)")
                                }
                                BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_SERVER_ERROR_CODE, withDescription: BI_SERVER_ERROR, withUserInfo: (err as NSError?)?.userInfo)
                            }
                            semaphore.signal()
                        })
                        (semaphore.wait(timeout: DispatchTime.distantFuture) == .success ? 0 : -1)

                        if didFail {
                            break
                        }

                        print(String(format: "[BI] the batch containing %lu events sent successfully, going to remove it from pending events", batch.count ))
                        eventsCopy = self.removeFromOneArrayIfPresentInOther(first: eventsCopy ?? [[:]], second: batch)
                        let lockQueue = DispatchQueue(label: "self")
                        lockQueue.sync {
                            pendingEvents = self.removeFromOneArrayIfPresentInOther(first: pendingEvents ?? [[:]], second: batch)
                        }
                    } else {
                        //remove the defective events from our pending events
                        removeDefectiveEvents()

                        if config?.isDebugEnabled() == true {
                            assert(false, "JSON object for server call is not valid.")
                        }
                        break
                    }
            }
        }
        catch {
            print(error)
        }
        defer {
            isBlockSubmittedToNetworkQueue = false
        }
        return true
    }


    private func handleNetworkResponse(_ response: NSObject?, withError error: Error?) -> Bool {
        //No need to retry in case of failure as bi events are sent every minute forcefully
        if response is [AnyHashable : Any] {
            let respDict = response as? [AnyHashable : Any]
            if let result = respDict?["status"] as? String, result == "SUCCESS" {
                return true
            }
        }
        return false
    }

    private func archiveEvents() {
        let lockQueue = DispatchQueue(label: "self")
        lockQueue.sync {
            let filePath = eventsFilePath()
            if !archiveObject(pendingEvents, withFilePath: filePath) {
                print("[BI] could not archive pending events")
            }
        }
    }

    private func eventsFilePath() -> String? {
        return BlitzFileHelper.fullFilePathInDocumentsDirectory(forFileName: EVENTS_FILE_PATH)
    }

    private func removeDefectiveEvents() {
        var eventsCopy: [[String:Any]]?
        let lockQueue = DispatchQueue(label: "self")
        lockQueue.sync {
            eventsCopy = pendingEvents
        }

        var defectiveEvents: [[String:Any]] = []
        for event in eventsCopy ?? [] {
            if !JSONSerialization.isValidJSONObject(event) {
                defectiveEvents.append(event)
            }
        }

        lockQueue.sync {
            pendingEvents = self.removeFromOneArrayIfPresentInOther(first: pendingEvents ?? [[:]], second:   defectiveEvents)
                //pendingEvents?.filter({ !defectiveEvents.contains($0)})
                //[] pendingEvents?.removeObjects(inArray: defectiveEvents)
        }

        //Recording crashlytics error
        let defectiveEventsNames = (defectiveEvents as? NSMutableArray)?.value(forKeyPath: EVENT_NAME_TAG) as? [String]
        let commaSeparatedNames = defectiveEventsNames?.joined(separator: ", ")
        print(String(format: "[BI] defective events with names: %@, and total defective count: %lu, removed from pending events.", commaSeparatedNames ?? "", defectiveEvents.count))
        BlitzBiEventSendHandler.sendCrashlyticsError(
            withCode: BI_JSON_DATA_ERROR_CODE,
            withDescription: BI_JSON_DATA_ERROR,
            withUserInfo: [
                BAD_EVENTS_NAMES: commaSeparatedNames,
                BAD_EVENTS_COUNT: String(format: "%lu", defectiveEvents.count)
            ])

        //as now defective events has been filetered, we can force flush.
        flush(withIsForced: true)
    }

    private func archiveObject(_ object: Any?, withFilePath filePath: String?) -> Bool {
        do {
            if let object = object {
                if try !NSKeyedArchiver.archiveRootObject(object, toFile: filePath ?? "") {
                    BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_ARCHIVE_DATA_FAILURE_CODE, withDescription: BI_ARCHIVE_DATA_FAILURE, withUserInfo: nil)
                    return false
                }
            }
            
        }
        
        catch {
            BlitzBiEventSendHandler.sendCrashlyticsError(
            withCode: BI_ARCHIVE_DATA_EXCEPTION_CODE,
            withDescription: BI_ARCHIVE_DATA_EXCEPTION,
            withUserInfo: [
                EXCEPTION_NAME: "exception.name",
                EXCEPTION_REASON: "exception.reason"
            ])
            return false
        }

        addSkipBackupAttributeToItem(atPath: filePath)
        return true
    }

    private func addSkipBackupAttributeToItem(atPath filePathString: String?) -> Bool {
        let url = URL(fileURLWithPath: filePathString ?? "")
        let fileExists = FileManager.default.fileExists(atPath: url.path)
        if config?.isDebugEnabled() == true {
            assert(fileExists, "events file does not exist at filepath")
        }
        var _: Error? = nil
        if fileExists {
            var success = false
            do {
                try (url as NSURL).setResourceValue(NSNumber(value: true), forKey: .isExcludedFromBackupKey)
                success = true
            } catch {
                print("[BI] Error in excluding \(url.lastPathComponent) from backup \(error)")
                var userInfo = (error as NSError?)?.userInfo
                userInfo?[FILE_NAME] = url.lastPathComponent
                BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_EXCLUDING_FROM_BACKUP_ERROR_CODE, withDescription: BI_EXCLUDING_FROM_BACKUP_ERROR, withUserInfo: userInfo)
            }
            return success
        }
        BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_FILE_NOT_EXISTS_ERROR_CODE, withDescription: BI_FILE_NOT_EXISTS_ERROR, withUserInfo: [
            FILE_NAME: url.lastPathComponent
        ])
        return false
    }

    private func unarchiveEvents() {
        pendingEvents = BlitzBiEventSendHandler.unarchiveOrDefault(fromFile: eventsFilePath(), as: NSMutableArray.self) as? [[String:Any]]
        var newPendingEvents: [[String:Any]] = [[:]]
        for event in pendingEvents ?? [[:]] {
            var eventDict = event
            eventDict[COMMON_FIELD_3] = "1"
            newPendingEvents.append(eventDict)
        }
        pendingEvents = newPendingEvents
    }

    class func unarchiveOrDefault(fromFile filePath: String?, as `class`: AnyClass) -> Any {
        return self.unarchive(fromFile: filePath, as: `class`)
    }

    class func unarchive(fromFile filePath: String?, as `class`: AnyClass) -> Any? {
        var unarchivedData: Any? = nil
        do {
            unarchivedData = try NSKeyedUnarchiver.unarchiveObject(withFile: filePath ?? "")
            if !(unarchivedData is Any) {
                unarchivedData = nil
            }
            if let unarchivedData = unarchivedData {
                print("[BI] unarchived data from \(filePath ?? ""): \(unarchivedData)")
            }
        } catch {
            BlitzBiEventSendHandler.sendCrashlyticsError(
                withCode: BI_UNARCHIVE_DATA_ERROR_CODE,
                withDescription: BI_UNARCHIVE_DATA_ERROR,
                withUserInfo: [
                    FILE_NAME_TAG: filePath ?? "",
                   // EXCEPTION_NAME: exception.name,
                   // EXCEPTION_REASON: exception.reason
                ])
            unarchivedData = nil

            var error: Error?
            var removed = false
            do {
                try FileManager.default.removeItem(atPath: filePath ?? "")
                removed = true
            } catch {
                var userInfo = (error as NSError?)?.userInfo
                userInfo?[FILE_NAME_TAG] = filePath
                BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_FILE_REMOVAL_FAILURE_CODE, withDescription: BI_FILE_REMOVAL_FAILURE, withUserInfo: userInfo)
            }
        }
        return unarchivedData
    }

    private func dispatch(onNetworkQueue dispatchBlock: @escaping () -> Void) {
        /* The reason behind this logic is that we want to make sure
             * that flush happens after the event has been added to the pending events list
             * event comes -> event added to pending list -> list is flushed */
        serialQueue?.async(execute: { [self] in
            self.networkQueue?.async(execute: dispatchBlock)
        })
    }

    private func shouldFlushEvents() -> Bool {
        var pendingEventsCount = 0
        let lockQueue = DispatchQueue(label: "self")
        lockQueue.sync {
            pendingEventsCount = pendingEvents?.count ?? 0
        }
        let isPendingEventsCrossedMaxLimit = pendingEventsCount >= maxPendingCount
        let hasTimeCrossedCooldown = Date().timeIntervalSince1970 > nextFlushTime
        return isPendingEventsCrossedMaxLimit || hasTimeCrossedCooldown
    }

    private func updateNextFlushTime() {
        let nextDate = Date(timeIntervalSinceNow: TimeInterval(forceSendAfterSeconds))
        nextFlushTime = nextDate.timeIntervalSince1970
    }

    private func setBatchSize(_ size: Int) {
        maxPendingCount = size
    }

    private func getJSONData(forBatch batch: [[AnyHashable:Any]]?) -> Data? {
        var error: Error?
        var biDictionary: [AnyHashable : Any] = [:]
        biDictionary["events"] = batch
        var jsonData: Data? = nil
        do {
            jsonData = try JSONSerialization.data(withJSONObject: biDictionary, options: [])
        } catch {
        }

        if jsonData == nil || error != nil {
            if let error = error {
                print("Error in getting json data for batch \(batch ?? []) with error \(error)")
            }
            BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_JSON_DATA_ERROR_CODE, withDescription: BI_JSON_DATA_ERROR, withUserInfo: (error as NSError?)?.userInfo)
        }
        return jsonData
    }

    private func onDiffReceived() {
        // check if app params are configured for this
        //  forceSendAfterSeconds = [[AppParamModel getSharedInstance] getFloatValueWithKey:FLUSH_AFTER_APP_PARAM_KEY defaultValue:30];
        //   maxPendingCount = [[AppParamModel getSharedInstance] getIntValueWithKey:MAX_BATCH_SIZE_APP_PARAM_KEY defaultValue:200];
    }

    private class func sendCrashlyticsError(withCode code: Int, withDescription description: String?, withUserInfo userInfo: [AnyHashable : Any]?) {
        //  [Utility sendCrashlyticsErrorWithDomain:BUNDLE_IDENTIFIER withCode:code withDescription:description withUserInfo:userInfo];
    }
    
    private func removeFromOneArrayIfPresentInOther(first:[[String:Any]], second:[[String:Any]]) -> [[String:Any]] {
        var i = 0
        var result = first
        while i < result.count {
            for eve in second {
                if NSDictionary(dictionary: result[i]).isEqual(to: eve) {
                    result.remove(at: i)
                }
            }
            i = i+1
        }
        return result
    }
}


struct BiResponse:Codable {
    var status:String
}
