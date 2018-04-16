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

#import <MaterialComponents/MaterialColorScheme.h>
#import <MaterialComponents/MaterialTypographyScheme.h>


/**
 ApplicationScheme is a central object for setting the application's colors and typography.
 */
@interface ApplicationScheme : NSObject <MDCColorScheming, MDCTypographyScheming>

+ (instancetype)scheme;
- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Color Scheme

@property(nonnull, readonly, nonatomic) UIColor *primaryColor;
@property(nonnull, readonly, nonatomic) UIColor *primaryColorVariant;
@property(nonnull, readonly, nonatomic) UIColor *secondaryColor;
@property(nonnull, readonly, nonatomic) UIColor *errorColor;
@property(nonnull, readonly, nonatomic) UIColor *surfaceColor;
@property(nonnull, readonly, nonatomic) UIColor *backgroundColor;
@property(nonnull, readonly, nonatomic) UIColor *onPrimaryColor;
@property(nonnull, readonly, nonatomic) UIColor *onSecondaryColor;
@property(nonnull, readonly, nonatomic) UIColor *onSurfaceColor;
@property(nonnull, readonly, nonatomic) UIColor *onBackgroundColor;

#pragma mark - Typography Scheme

@property(nonatomic, nonnull, readonly) UIFont *headline1;
@property(nonatomic, nonnull, readonly) UIFont *headline2;
@property(nonatomic, nonnull, readonly) UIFont *headline3;
@property(nonatomic, nonnull, readonly) UIFont *headline4;
@property(nonatomic, nonnull, readonly) UIFont *headline5;
@property(nonatomic, nonnull, readonly) UIFont *headline6;
@property(nonatomic, nonnull, readonly) UIFont *subtitle1;
@property(nonatomic, nonnull, readonly) UIFont *subtitle2;
@property(nonatomic, nonnull, readonly) UIFont *body1;
@property(nonatomic, nonnull, readonly) UIFont *body2;
@property(nonatomic, nonnull, readonly) UIFont *caption;
@property(nonatomic, nonnull, readonly) UIFont *button;
@property(nonatomic, nonnull, readonly) UIFont *overline;

@end
