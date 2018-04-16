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

  override func viewDidLoad() {
    super.viewDidLoad()

    self.collectionView?.backgroundColor = .orange
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if (self.collectionViewLayout is UICollectionViewFlowLayout ) {
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

  //MARK - UICollectionViewDataSource
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    return 11
  }

  override func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "ProductCell",
                                                        for: indexPath) as! ProductCell
//    let product = Catalog.productAtIndex(index: indexPath.row)
//    cell.nameLabel.text = product.productName
//    cell.priceLabel.text = product.price
    cell.nameLabel.text = "Product Name"
    cell.priceLabel.text = "$33.44"
    return cell
  }

}
