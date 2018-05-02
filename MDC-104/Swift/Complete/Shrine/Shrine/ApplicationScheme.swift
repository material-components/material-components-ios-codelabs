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

class ApplicationScheme: NSObject, MDCColorScheming, MDCTypographyScheming, MDCButtonScheming {

  static let staticColorScheme: MDCSemanticColorScheme = {
    let scheme = MDCSemanticColorScheme(defaults: .material201804)
    scheme.primaryColor =
      UIColor(red: 252.0/255.0, green: 184.0/255.0, blue: 171.0/255.0, alpha: 1.0)
    scheme.onPrimaryColor = .black
    scheme.surfaceColor = UIColor(red: 254.0/255.0, green: 219.0/255.0, blue: 208.0/255.0, alpha: 1.0)
    scheme.onSurfaceColor = .black
    return scheme
  }()

  static let staticTypographyScheme: MDCTypographyScheme = {
    let scheme = MDCTypographyScheme()
    let fontName = "Rubik"
    scheme.headline5 = UIFont(name: fontName, size: 24)!
    scheme.headline6 = UIFont(name: fontName, size: 20)!
    scheme.subtitle1 = UIFont(name: fontName, size: 16)!
    scheme.button = UIFont(name: fontName, size: 14)!
    return scheme
  }()

  public private(set) var cornerRadius: CGFloat = {
    return CGFloat(6.1)
  }()

  public private(set) var minimumHeight: CGFloat = {
    return CGFloat(32.0)
  }()

  private static var singleton = ApplicationScheme()

  static var scheme: ApplicationScheme {
    return singleton
  }

  public private(set) var colorScheme: MDCColorScheming = {
    return ApplicationScheme.staticColorScheme
  }()

  public private(set) var typographyScheme: MDCTypographyScheming = {
    return ApplicationScheme.staticTypographyScheme
  }()

  public private(set) var primaryColor: UIColor = {
    return staticColorScheme.primaryColor
  }()
  public private(set) var primaryColorVariant: UIColor = {
    return staticColorScheme.primaryColorVariant
  }()
  public private(set) var secondaryColor: UIColor = {
    return staticColorScheme.secondaryColor
  }()
  public private(set) var errorColor: UIColor = {
    return staticColorScheme.errorColor
  }()
  public private(set) var surfaceColor: UIColor = {
    return staticColorScheme.surfaceColor
  }()
  public private(set) var backgroundColor: UIColor = {
    return staticColorScheme.backgroundColor
  }()
  public private(set) var onPrimaryColor: UIColor = {
    return staticColorScheme.onPrimaryColor
  }()
  public private(set) var onSecondaryColor: UIColor = {
    return staticColorScheme.onSecondaryColor
  }()
  public private(set) var onSurfaceColor: UIColor = {
    return staticColorScheme.onSurfaceColor
  }()
  public private(set) var onBackgroundColor: UIColor = {
    return staticColorScheme.onBackgroundColor
  }()

  public private(set) var headline1: UIFont = {
    return staticTypographyScheme.headline1
  }()
  public private(set) var headline2: UIFont = {
    return staticTypographyScheme.headline2
  }()
  public private(set) var headline3: UIFont = {
    return staticTypographyScheme.headline3
  }()
  public private(set) var headline4: UIFont = {
    return staticTypographyScheme.headline4
  }()
  public private(set) var headline5: UIFont = {
    return staticTypographyScheme.headline5
  }()
  public private(set) var headline6: UIFont = {
    return staticTypographyScheme.headline6
  }()
  public private(set) var subtitle1: UIFont = {
    return staticTypographyScheme.subtitle1
  }()
  public private(set) var subtitle2: UIFont = {
    return staticTypographyScheme.subtitle2
  }()
  public private(set) var body1: UIFont = {
    return staticTypographyScheme.body1
  }()
  public private(set) var body2: UIFont = {
    return staticTypographyScheme.body2
  }()
  public private(set) var caption: UIFont = {
    return staticTypographyScheme.caption
  }()
  public private(set) var button: UIFont = {
    return staticTypographyScheme.button
  }()
  public private(set) var overline: UIFont = {
    return staticTypographyScheme.overline
  }()
}
