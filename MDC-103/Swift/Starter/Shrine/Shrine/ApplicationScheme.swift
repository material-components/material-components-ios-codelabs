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

import UIKit

import MaterialComponents

class ApplicationScheme: NSObject, MDCColorScheming, MDCTypographyScheming {
  private static let colorScheme: MDCSemanticColorScheme = {
    // Instantiate a MDCSemanticColorScheme object
    let scheme = MDCSemanticColorScheme(defaults: .material201804)
    //TODO: Customize ApplicationScheme Colors after this line
    return scheme
  }()

  private static let typographyScheme: MDCTypographyScheme = {
    let scheme = MDCTypographyScheme()
    //TODO: Add our custom fonts after this line
    return scheme
  }()

  private static var singleton = ApplicationScheme()

  static var scheme: ApplicationScheme {
    return singleton
  }

  public private(set) var primaryColor: UIColor = {
    return colorScheme.primaryColor
  }()
  public private(set) var primaryColorVariant: UIColor = {
    return colorScheme.primaryColorVariant
  }()
  public private(set) var secondaryColor: UIColor = {
    return colorScheme.secondaryColor
  }()
  public private(set) var errorColor: UIColor = {
    return colorScheme.errorColor
  }()
  public private(set) var surfaceColor: UIColor = {
    return colorScheme.surfaceColor
  }()
  public private(set) var backgroundColor: UIColor = {
    return colorScheme.backgroundColor
  }()
  public private(set) var onPrimaryColor: UIColor = {
    return colorScheme.onPrimaryColor
  }()
  public private(set) var onSecondaryColor: UIColor = {
    return colorScheme.onSecondaryColor
  }()
  public private(set) var onSurfaceColor: UIColor = {
    return colorScheme.onSurfaceColor
  }()
  public private(set) var onBackgroundColor: UIColor = {
    return colorScheme.onBackgroundColor
  }()

  public private(set) var headline1: UIFont = {
    return typographyScheme.headline1
  }()
  public private(set) var headline2: UIFont = {
    return typographyScheme.headline2
  }()
  public private(set) var headline3: UIFont = {
    return typographyScheme.headline3
  }()
  public private(set) var headline4: UIFont = {
    return typographyScheme.headline4
  }()
  public private(set) var headline5: UIFont = {
    return typographyScheme.headline5
  }()
  public private(set) var headline6: UIFont = {
    return typographyScheme.headline6
  }()
  public private(set) var subtitle1: UIFont = {
    return typographyScheme.subtitle1
  }()
  public private(set) var subtitle2: UIFont = {
    return typographyScheme.subtitle2
  }()
  public private(set) var body1: UIFont = {
    return typographyScheme.body1
  }()
  public private(set) var body2: UIFont = {
    return typographyScheme.body2
  }()
  public private(set) var caption: UIFont = {
    return typographyScheme.caption
  }()
  public private(set) var button: UIFont = {
    return typographyScheme.button
  }()
  public private(set) var overline: UIFont = {
    return typographyScheme.overline
  }()
}
