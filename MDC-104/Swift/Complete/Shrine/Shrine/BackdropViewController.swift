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
  
//  var containerView: UIView = {
  var containerView: ShapedShadowedView = {
    let view = ShapedShadowedView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
  }()

  let featuredButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("FEATURED", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let apartmentButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("APARTMENT", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let accessoriesButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("ACCESSORIES", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let shoesButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("SHOES", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let topsButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("TOPS", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let bottomsButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("BOTTOMS", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let dressesButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("DRESSES", for: .normal)
    button.addTarget(self, action: #selector(didTapCategory(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
    return button
  }()

  let accountButton: MDCFlatButton = {
    let button = MDCFlatButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("ACCOUNT", for: .normal)
    button.addTarget(self, action: #selector(menuItemTapped(sender:)), for: .touchUpInside)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: button)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme, to: button)
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

    self.view.backgroundColor = ApplicationScheme.scheme.surfaceColor

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
    MDCAppBarColorThemer.applySemanticColorScheme(ApplicationScheme.scheme, to: appBar)
    self.appBar.navigationBar.translatesAutoresizingMaskIntoConstraints = false

    // Buttons
    self.view.addSubview(featuredButton)
    self.view.addSubview(apartmentButton)
    self.view.addSubview(accessoriesButton)
    self.view.addSubview(shoesButton)
    self.view.addSubview(topsButton)
    self.view.addSubview(bottomsButton)
    self.view.addSubview(dressesButton)
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
      "apartment" : self.apartmentButton,
      "accessories" : self.accessoriesButton,
      "shoes" : self.shoesButton,
      "tops" : self.topsButton,
      "bottoms" : self.bottomsButton,
      "dresses" : self.dressesButton,
      "account" : self.accountButton
    ]

    constraints.append(contentsOf:
        NSLayoutConstraint.constraints(withVisualFormat: "V:|[navigationbar]-[featured]-[apartment]-[accessories]-[shoes]-[tops]-[bottoms]-[dresses]-[account]", options: .alignAllCenterX, metrics: nil, views: nameView))

    NSLayoutConstraint.activate(constraints)

    self.view.addSubview(self.containerView)

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController =
      storyboard.instantiateViewController(withIdentifier: "HomeViewController")
    self.insert(viewController)

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
      filter = ""
    } else if (view == self.apartmentButton) {
      filter = "apartment"
    } else if (view == self.accessoriesButton) {
      filter = "accessories"
    } else if (view == self.shoesButton) {
      filter = "shoes"
    } else if (view == self.topsButton) {
      filter = "top"
    } else if (view == self.bottomsButton) {
      filter = "bottoms"
    } else if (view == self.dressesButton) {
      filter = "dresses"
    } else {
      filter = ""
    }

    Catalog.categoryFilter = filter

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
