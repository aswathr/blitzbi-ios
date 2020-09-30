//
//  UserPropertyModel.h
//  ArVideoDemo
//
//  Created by Anuj Kaura on 29/10/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UserPropertyModel
@end

@interface UserPropertyModel : JSONModel

@property (copy, nonatomic) NSString<Optional> *propertyKey;
@property (copy, nonatomic) NSString<Optional> *propertyValue;

@end

NS_ASSUME_NONNULL_END
