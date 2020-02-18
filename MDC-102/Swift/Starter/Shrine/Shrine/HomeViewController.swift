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
  //TODO: Add an appBarViewController property

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.tintColor = .black
    self.view.backgroundColor = .white

    self.title = "Shrine"

    self.collectionView?.backgroundColor = .white

    // AppBar Setup
    //TODO: Add the appBar controller and views

    // Setup Navigation Items
    //TODO: Create the items and set them on the view controller's navigationItems properties

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

  // MARK - Methods
  @objc func menuItemTapped(sender: Any) {
    let loginViewController = LoginViewController(nibName: nil, bundle: nil)
    self.present(loginViewController, animated: true, completion: nil)
  }

  // MARK - UICollectionViewDataSource'

  // TODO: Implement the following methods
  //  func collectionView(_ collectionView: UICollectionView,
  //                      numberOfItemsInSection section: Int) -> Int {
  //
  //  }
  //
  //
  //  func collectionView(_ collectionView: UICollectionView,
  //                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  //
  //  }

}

//MARK: - UIScrollViewDelegate

// The following four methods must be forwarded to the tracking scroll view in order to implement
// the Flexible Header's behavior.

//TODO: Send the scrollView delegate messages to our appBar's headerView
