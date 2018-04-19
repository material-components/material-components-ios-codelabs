/*
 Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>


@interface Product : NSObject

@property (nonatomic, readonly) NSString *imageName;
@property (nonatomic, readonly) NSString *productName;
@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSString *category;

@end


/**
 Catalog exposes the model of our app

 It should be accessed through the +productCatalog class method.
 */
@interface Catalog : NSObject

+ (instancetype)productCatalog;
- (instancetype)init NS_UNAVAILABLE;

@property (nonatomic, readonly) NSUInteger count;
- (Product *)productAtIndex:(NSUInteger)index;

@property (nonatomic, nonnull, copy) NSString *categoryFilter;

@end
