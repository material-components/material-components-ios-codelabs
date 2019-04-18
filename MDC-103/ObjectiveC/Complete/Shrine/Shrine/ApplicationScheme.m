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

#import "ApplicationScheme.h"

@implementation ApplicationScheme {
  MDCSemanticColorScheme *_colorScheme;
  MDCTypographyScheme *_typographyScheme;
}

+ (instancetype)sharedInstance {
  static ApplicationScheme *scheme;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    // TODO: Change scheme to initialize with initAlternativeSingleton
    scheme = [[ApplicationScheme alloc] initStandardSingleton];
  });
  return scheme;
}

- (instancetype)initStandardSingleton {
  self = [super init];
  if (self) {
    // Instantiate a MDCSemanticColorScheme object and modify it to our chosen colors
    _colorScheme =
        [[MDCSemanticColorScheme alloc] initWithDefaults:MDCColorSchemeDefaultsMaterial201804];
    // TODO: Add our custom colors after this line
    _colorScheme.primaryColor = [UIColor colorWithRed:252.0 / 255.0
                                                green:184.0 / 255.0
                                                 blue:171.0 / 255.0
                                                alpha:1.0];
    _colorScheme.onPrimaryColor = [UIColor colorWithRed:68.0 / 255.0
                                                  green:44.0 / 255.0
                                                   blue:46.0 / 255.0
                                                  alpha:1.0];
    _colorScheme.secondaryColor = [UIColor colorWithRed:254.0 / 255.0
                                                  green:234.0 / 255.0
                                                   blue:230.0 / 255.0
                                                  alpha:1.0];
    _colorScheme.onSecondaryColor = [UIColor colorWithRed:68.0 / 255.0
                                                    green:44.0 / 255.0
                                                     blue:46.0 / 255.0
                                                    alpha:1.0];
    _colorScheme.surfaceColor = [UIColor colorWithRed:255.0 / 255.0
                                                green:251.0 / 255.0
                                                 blue:250.0 / 255.0
                                                alpha:1.0];
    _colorScheme.onSurfaceColor = [UIColor colorWithRed:68.0 / 255.0
                                                  green:44.0 / 255.0
                                                   blue:46.0 / 255.0
                                                  alpha:1.0];
    _colorScheme.backgroundColor = [UIColor colorWithRed:255.0 / 255.0
                                                   green:255.0 / 255.0
                                                    blue:255.0 / 255.0
                                                   alpha:1.0];
    _colorScheme.onBackgroundColor = [UIColor colorWithRed:68.0 / 255.0
                                                     green:44.0 / 255.0
                                                      blue:46.0 / 255.0
                                                     alpha:1.0];
    _colorScheme.errorColor = [UIColor colorWithRed:197.0 / 255.0
                                              green:3.0 / 255.0
                                               blue:43.0 / 255.0
                                              alpha:1.0];

    // Instantiate a MDCSemanticColorScheme object and modify it to our chosen colors
    _typographyScheme =
        [[MDCTypographyScheme alloc] initWithDefaults:MDCTypographySchemeDefaultsMaterial201804];
    // TODO: Add our custom fonts after this line
    NSString *fontName = @"Rubik";
    _typographyScheme.headline5 = [UIFont fontWithName:fontName size:24.0];
    _typographyScheme.headline6 = [UIFont fontWithName:fontName size:20.0];
    _typographyScheme.subtitle1 = [UIFont fontWithName:fontName size:16.0];
    _typographyScheme.button = [UIFont fontWithName:fontName size:14.0];

    // Create a button scheme based off our custom colors and typography
    _buttonScheme = [[MDCButtonScheme alloc] init];
    _buttonScheme.colorScheme = _colorScheme;
    _buttonScheme.typographyScheme = _typographyScheme;
  }
  return self;
}

- (instancetype)initAlternativeSingleton {
  self = [super init];
  if (self) {
    _colorScheme =
        [[MDCSemanticColorScheme alloc] initWithDefaults:MDCColorSchemeDefaultsMaterial201804];
    _colorScheme.primaryColor =
        [UIColor colorWithRed:0.36f green:0.06f blue:0.29f alpha:1];
    _colorScheme.onPrimaryColor = [UIColor whiteColor];
    _colorScheme.secondaryColor =
        [UIColor colorWithRed:0.89f green:0.02f blue:0.15f alpha:1];
    _colorScheme.onSecondaryColor = [UIColor whiteColor];
    _colorScheme.surfaceColor = [UIColor whiteColor];
    _colorScheme.onSurfaceColor = [UIColor blackColor];
    _colorScheme.backgroundColor =
        [UIColor colorWithRed:0.96f green:0.89f blue:0.93f alpha:1];
    _colorScheme.onBackgroundColor = [UIColor blackColor];
    _colorScheme.errorColor =
        [UIColor colorWithRed:0.99f green:0.59f blue:0.15f alpha:1];
    _typographyScheme =
        [[MDCTypographyScheme alloc] initWithDefaults:MDCTypographySchemeDefaultsMaterial201804];
    NSString *fontName = @"Chalkduster";
    _typographyScheme.headline5 = [UIFont fontWithName:fontName size:24.0];
    _typographyScheme.headline6 = [UIFont fontWithName:fontName size:20.0];
    _typographyScheme.subtitle1 = [UIFont fontWithName:fontName size:16.0];
    _typographyScheme.button = [UIFont fontWithName:fontName size:14.0];

    _buttonScheme = [[MDCButtonScheme alloc] init];
    _buttonScheme.colorScheme = _colorScheme;
    _buttonScheme.typographyScheme = _typographyScheme;
  }
  return self;
}

- (UIColor *)primaryColor {
  return _colorScheme.primaryColor;
}

- (UIColor *)primaryColorVariant {
  return _colorScheme.primaryColorVariant;
}

- (UIColor *)secondaryColor {
  return _colorScheme.secondaryColor;
}

- (UIColor *)errorColor {
  return _colorScheme.errorColor;
}

- (UIColor *)surfaceColor {
  return _colorScheme.surfaceColor;
}

- (UIColor *)backgroundColor {
  return _colorScheme.backgroundColor;
}

- (UIColor *)onPrimaryColor {
  return _colorScheme.onPrimaryColor;
}

- (UIColor *)onSecondaryColor {
  return _colorScheme.onSecondaryColor;
}

- (UIColor *)onSurfaceColor {
  return _colorScheme.onSurfaceColor;
}

- (UIColor *)onBackgroundColor {
  return _colorScheme.onBackgroundColor;
}

- (UIFont *)headline1 {
  return _typographyScheme.headline1;
}

- (UIFont *)headline2 {
  return _typographyScheme.headline2;
}

- (UIFont *)headline3 {
  return _typographyScheme.headline3;
}

- (UIFont *)headline4 {
  return _typographyScheme.headline4;
}

- (UIFont *)headline5 {
  return _typographyScheme.headline5;
}

- (UIFont *)headline6 {
  return _typographyScheme.headline6;
}

- (UIFont *)subtitle1 {
  return _typographyScheme.subtitle1;
}

- (UIFont *)subtitle2 {
  return _typographyScheme.subtitle2;
}

- (UIFont *)body1 {
  return _typographyScheme.body1;
}

- (UIFont *)body2 {
  return _typographyScheme.body2;
}

- (UIFont *)caption {
  return _typographyScheme.caption;
}

- (UIFont *)button {
  return _typographyScheme.button;
}

- (UIFont *)overline {
  return _typographyScheme.overline;
}

@end
