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

class HomeViewController: UICollectionViewController {
  var shouldDisplayLogin = true
  //TODO: Add an appBar property
  var appBar = MDCAppBar()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.tintColor = .black
    self.view.backgroundColor = .white

    self.title = "Shrine"

    self.collectionView?.backgroundColor = .white

    // AppBar Setup
    //TODO: Add the appBar controller and views
    self.addChildViewController(appBar.headerViewController)
    self.appBar.headerViewController.headerView.trackingScrollView = self.collectionView
    appBar.addSubviewsToParent()

    // Setup Navigation Items
    //TODO: Create the items and set them on the view controller's navigationItems properties
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
                                     target: nil,
                                     action: nil)
    let tuneItemImage = UIImage(named: "TuneItem")
    let templatedTuneItemImage = tuneItemImage?.withRenderingMode(.alwaysTemplate)
    let tuneItem = UIBarButtonItem(image: templatedTuneItemImage,
                                   style: .plain,
                                   target: nil,
                                   action: nil)
    self.navigationItem.rightBarButtonItems = [ tuneItem, searchItem ]


  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if (self.collectionViewLayout is UICollectionViewFlowLayout) {
      let flowLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
      let HORIZONTAL_SPACING: CGFloat = 8.0
      let itemDimension: CGFloat = (self.view.frame.size.width - 3.0 * HORIZONTAL_SPACING) * 0.5
      let itemSize = CGSize(width: itemDimension, height: itemDimension)
      flowLayout.itemSize = itemSize
    }

    if (self.shouldDisplayLogin) {
      let loginViewController = LoginViewController(nibName: nil, bundle: nil)
      self.present(loginViewController, animated: false, completion: nil)
      self.shouldDisplayLogin = false
    }
  }

  //MARK - Methods
  @objc func menuItemTapped(sender: Any) {
    let loginViewController = LoginViewController(nibName: nil, bundle: nil)
    self.present(loginViewController, animated: true, completion: nil)
  }

  //MARK - UICollectionViewDataSource
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    //TODO: Set the number of cells to be equal to the number of products in the catalog
    return Catalog.count
  }

  override func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "ProductCell",
                                                        for: indexPath) as! ProductCell
    //TODO: Set the properties of the cell to reflect to product from the model
    let product = Catalog.productAtIndex(index: indexPath.row)
    cell.imageView.image = UIImage(named: product.imageName)
    cell.nameLabel.text = product.productName
    cell.priceLabel.text = product.price

    return cell
  }

}

//MARK: - UIScrollViewDelegate

// The following four methods must be forwarded to the tracking scroll view in order to implement
// the Flexible Header's behavior.

//TODO: Send the scrollView delegate messages to our appBar's headerView
extension HomeViewController {

  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if (scrollView == self.appBar.headerViewController.headerView.trackingScrollView) {
      self.appBar.headerViewController.headerView.trackingScrollDidScroll()
    }
  }

  override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if (scrollView == self.appBar.headerViewController.headerView.trackingScrollView) {
      self.appBar.headerViewController.headerView.trackingScrollDidEndDecelerating()
    }
  }

  override func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                         willDecelerate decelerate: Bool) {
    let headerView = self.appBar.headerViewController.headerView
    if (scrollView == headerView.trackingScrollView) {
      headerView.trackingScrollDidEndDraggingWillDecelerate(decelerate)
    }
  }

  override func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                          withVelocity velocity: CGPoint,
                                          targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let headerView = self.appBar.headerViewController.headerView
    if (scrollView == headerView.trackingScrollView) {
      headerView.trackingScrollWillEndDragging(withVelocity: velocity,
                                               targetContentOffset: targetContentOffset)
    }
  }

}
