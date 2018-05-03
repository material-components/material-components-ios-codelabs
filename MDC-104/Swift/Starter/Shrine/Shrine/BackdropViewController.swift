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

class BackdropViewController: UIViewController {
  var appBar = MDCAppBar()
  
  //TODO: Change the following two lines from UIView to ShapedShadowedView
  var containerView: UIView = {
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    if let shapedShadowedLayer = view.layer as? MDCShapedShadowLayer {
      shapedShadowedLayer.shapedBackgroundColor = .white
    } else {
      view.backgroundColor = .white
    }
    return view
  }()

  let featuredButton: MDCButton = {
    let button = MDCButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("FEATURED", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCTextButtonThemer.applyScheme(ApplicationScheme.shared.buttonScheme, to: button)
    return button
  }()

  let clothingButton: MDCButton = {
    let button = MDCButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("CLOTHING", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCTextButtonThemer.applyScheme(ApplicationScheme.shared.buttonScheme, to: button)
    return button
  }()

  let homeButton: MDCButton = {
    let button = MDCButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("HOME", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCTextButtonThemer.applyScheme(ApplicationScheme.shared.buttonScheme, to: button)
    return button
  }()

  let accessoriesButton: MDCButton = {
    let button = MDCButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("ACCESSORIES", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCTextButtonThemer.applyScheme(ApplicationScheme.shared.buttonScheme, to: button)
    return button
  }()

  let accountButton: MDCButton = {
    let button = MDCButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("ACCOUNT", for: .normal)
    button.addTarget(self, action: #selector(menuItemTapped(sender:)), for: .touchUpInside)
    MDCTextButtonThemer.applyScheme(ApplicationScheme.shared.buttonScheme, to: button)
    return button
  }()

  var embeddedView: UIView?
  var embeddedViewController: UIViewController?

  var isFocusedEmbeddedController: Bool = false {
    didSet {
      UIView.animate(withDuration: 0.2) {
        self.containerView.frame = self.frameForEmbeddedController()
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = ApplicationScheme.shared.colorScheme.surfaceColor

    self.title = "Shrine"

    // Setup Navigation Items
    let menuItemImage = UIImage(named: "MenuItem")
    let templatedMenuItemImage = menuItemImage?.withRenderingMode(.alwaysTemplate)
    let menuItem = UIBarButtonItem(image: templatedMenuItemImage,
                                   style: .plain,
                                   target: self,
                                   action: #selector(menuItemTapped(sender:)))
    self.navigationItem.leftBarButtonItem = menuItem

    let searchItemImage = UIImage(named: "SearchItem")
    let templatedSearchItemImage = searchItemImage?.withRenderingMode(.alwaysTemplate)
    let searchItem = UIBarButtonItem(image: templatedSearchItemImage,
                                     style: .plain,
                                     target: self,
                                     action: #selector(filterItemTapped(sender:)))
    let tuneItemImage = UIImage(named: "TuneItem")
    let templatedTuneItemImage = tuneItemImage?.withRenderingMode(.alwaysTemplate)
    let tuneItem = UIBarButtonItem(image: templatedTuneItemImage,
                                   style: .plain,
                                   target: self,
                                   action: #selector(filterItemTapped(sender:)))
    self.navigationItem.rightBarButtonItems = [ tuneItem, searchItem ]

    // AppBar Init
    self.addChildViewController(appBar.headerViewController)
    appBar.addSubviewsToParent()
    MDCAppBarColorThemer.applySemanticColorScheme(ApplicationScheme.shared.colorScheme, to: appBar)
    self.appBar.navigationBar.translatesAutoresizingMaskIntoConstraints = false

    // Buttons
    self.view.addSubview(featuredButton)
    self.view.addSubview(clothingButton)
    self.view.addSubview(homeButton)
    self.view.addSubview(accessoriesButton)
    self.view.addSubview(accountButton)

    var constraints = [NSLayoutConstraint]()
    constraints.append(NSLayoutConstraint(item: self.featuredButton,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: self.view,
                                          attribute: .centerX,
                                          multiplier: 1.0,
                                          constant: 0.0))

    let nameView = [
      "navigationbar" : self.appBar.navigationBar,
      "featured" : self.featuredButton,
      "clothing" : self.clothingButton,
      "home" : self.homeButton,
      "accessories" : self.accessoriesButton,
      "account" : self.accountButton
    ]

    constraints.append(contentsOf:
        NSLayoutConstraint.constraints(withVisualFormat: "V:|[navigationbar]-[featured]-[clothing]-[home]-[accessories]-[account]", options: .alignAllCenterX, metrics: nil, views: nameView))

    NSLayoutConstraint.activate(constraints)

    let recognizer = UITapGestureRecognizer(target: self, action: #selector(filterItemTapped(sender:)))
    self.view.addGestureRecognizer(recognizer)

    self.view.addSubview(self.containerView)

    //TODO: Insert the HomeViewController into our BackdropViewController
  }

  override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()

    let embeddedFrame = self.frameForEmbeddedController()
    self.containerView.frame = embeddedFrame
    self.embeddedView?.frame = self.containerView.bounds
  }

  func frameForEmbeddedController() -> CGRect {
    var embeddedFrame = self.view.bounds
    var insetHeader = UIEdgeInsets()
    insetHeader.top = self.appBar.headerViewController.view.frame.maxY
    embeddedFrame = UIEdgeInsetsInsetRect(embeddedFrame, insetHeader)

    if !isFocusedEmbeddedController {
      embeddedFrame.origin.y = self.view.bounds.size.height - self.appBar.navigationBar.frame.height
    }

    if (embeddedView == nil) {
      embeddedFrame.origin.y = self.view.bounds.maxY
    }

    return embeddedFrame
  }

  //MARK - Actions
  @objc func menuItemTapped(sender: Any) {
    let loginViewController = LoginViewController(nibName: nil, bundle: nil)
    self.present(loginViewController, animated: true, completion: nil)
  }

  @objc func filterItemTapped(sender: Any) {
    isFocusedEmbeddedController = !isFocusedEmbeddedController
  }

  @objc func didTapCategory(sender: Any) {
    let filter: String
    let view = sender as! UIView
    if (view == self.featuredButton) {
      filter = "Featured"
    } else if (view == self.homeButton) {
      filter = "Home"
    } else if (view == self.accessoriesButton) {
      filter = "Accessories"
    } else if (view == self.clothingButton) {
      filter = "Clothing"
    } else {
      filter = ""
    }

    //TODO: Set the catalog filter based on the button pressed

    isFocusedEmbeddedController = !isFocusedEmbeddedController
  }

}

//MARK: - View Controller Containment

// The following methods implement View Controller Containment

extension BackdropViewController {
  func insert(_ controller: UIViewController) {
    if let controller = self.embeddedViewController,
      let view = self.embeddedView {
      controller.willMove(toParentViewController: nil)
      controller.removeFromParentViewController()
      self.embeddedViewController = nil

      view.removeFromSuperview()
      self.embeddedView = nil

      isFocusedEmbeddedController = false
    }
    controller.willMove(toParentViewController: self)
    self.addChildViewController(controller)
    self.embeddedViewController = controller

    self.containerView.addSubview(controller.view)
    self.embeddedView = controller.view
    self.embeddedView?.backgroundColor = .clear

    isFocusedEmbeddedController = true
  }

  func removeController() {
    if let controller = self.embeddedViewController,
      let view = self.embeddedView {
      controller.willMove(toParentViewController: nil)
      controller.removeFromParentViewController()
      self.embeddedViewController = nil

      view.removeFromSuperview()
      self.embeddedView = nil

      isFocusedEmbeddedController = false
    }
  }
}
