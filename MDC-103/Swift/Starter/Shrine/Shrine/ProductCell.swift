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

class ProductCell: MDCCardCollectionCell {
    
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!

  func configureCell() {
    self.backgroundColor = .white

    //TODO: Set custom font based on our ApplicationScheme and center align text

    //TODO: Set to 0 to disable the curved corners
    self.cornerRadius = 4.0;

    //TODO: Set Border Width to 0 to disable the stroke outline
    self.setBorderWidth(1.0, for:.normal)
    self.setBorderColor(.lightGray, for: .normal)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    configureCell()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    configureCell()
  }
}
