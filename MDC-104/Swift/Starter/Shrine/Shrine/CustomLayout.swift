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

private let HORIZONTAL_PADDING: CGFloat = 0.10

class CustomLayout: UICollectionViewLayout {

  var itemASize: CGSize = .zero
  var itemBSize: CGSize = .zero
  var itemCSize: CGSize = .zero

  var itemAOffset: CGPoint = .zero
  var itemBOffset: CGPoint = .zero
  var itemCOffset: CGPoint = .zero

  var tripleSize: CGSize = .zero

  var frameCache = [NSValue]()

  override init() {
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func prepare() {
    super.prepare()

    var parentFrame = self.collectionView!.bounds.standardized
    parentFrame = UIEdgeInsetsInsetRect(parentFrame, self.collectionView!.adjustedContentInset)
    let contentHeight = parentFrame.size.height -
      (self.collectionView!.contentInset.top + self.collectionView!.contentInset.bottom)
    let contentWidth = parentFrame.size.width

    let landscapeItemSize = CGSize(width: contentWidth * 0.46, height: contentHeight * 0.32)
    let portaitItemSize = CGSize(width: contentWidth * 0.3, height: contentHeight * 0.54)

    self.itemASize = landscapeItemSize
    self.itemBSize = landscapeItemSize
    self.itemCSize = portaitItemSize

    self.itemAOffset = CGPoint(x: contentWidth * HORIZONTAL_PADDING, y: contentHeight * 0.66)
    self.itemBOffset = CGPoint(x: contentWidth * 0.3, y: contentHeight * 0.16)
    self.itemCOffset = CGPoint(x: self.itemBOffset.x + self.itemBSize.width + contentWidth * HORIZONTAL_PADDING, y: contentHeight * 0.2)

    self.tripleSize = CGSize(width: self.itemCOffset.x + self.itemCSize.width, height: contentHeight)

    self.frameCache.removeAll()
    for itemIndex in 0..<self.collectionView!.numberOfItems(inSection:0) {
      let tripleCount = itemIndex / 3
      let internalIndex = itemIndex % 3

      var itemFrame: CGRect = .zero
      if (internalIndex == 2) {
        itemFrame.size = self.itemCSize
      } else if (internalIndex == 1) {
        itemFrame.size = self.itemBSize
      } else {
        itemFrame.size = self.itemASize
      }

      itemFrame.origin.x = self.tripleSize.width * CGFloat(tripleCount)
      if (internalIndex == 2) {
        itemFrame.origin.x += self.itemCOffset.x
        itemFrame.origin.y = self.itemCOffset.y
      } else if (internalIndex == 1) {
        itemFrame.origin.x += self.itemBOffset.x
        itemFrame.origin.y = self.itemBOffset.y
      } else {
        itemFrame.origin.x += self.itemAOffset.x
        itemFrame.origin.y = self.itemAOffset.y
      }

      let frameValue: NSValue = NSValue(cgRect: itemFrame)
      self.frameCache.append(frameValue)
    }
  }

  override var collectionViewContentSize: CGSize {
    get {
      var contentSize: CGSize = .zero
      contentSize.height = self.tripleSize.height
      var lastItemFrame: CGRect = .zero
      let lastItemFrameValue: NSValue? = self.frameCache.last
      if ((lastItemFrameValue) != nil) {
        lastItemFrame = lastItemFrameValue!.cgRectValue
      }
      contentSize.width = lastItemFrame.maxX + HORIZONTAL_PADDING * self.collectionView!.frame.width
      return contentSize
    }
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()

    for itemIndex in 0..<self.frameCache.count {
      let itemFrame = self.frameCache[itemIndex].cgRectValue
      if rect.intersects(itemFrame) {
        let indexPath = IndexPath(row: itemIndex, section: 0)
        let attributes = self.collectionView!.layoutAttributesForItem(at: indexPath)!
        attributes.frame = itemFrame
        visibleLayoutAttributes.append(attributes)
      }
    }

    return visibleLayoutAttributes
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    let tripleCount = indexPath.row / 3
    let internalIndex = indexPath.row % 3

    var itemFrame: CGRect = .zero
    if (internalIndex == 2) {
      itemFrame.size = self.itemCSize
    } else if (internalIndex == 1) {
      itemFrame.size = self.itemBSize
    } else {
      itemFrame.size = self.itemASize
    }

    itemFrame.origin.x = self.tripleSize.width * CGFloat(tripleCount)
    if (internalIndex == 2) {
      itemFrame.origin.x += self.itemCOffset.x
      itemFrame.origin.y = self.itemCOffset.y
    } else if (internalIndex == 1) {
      itemFrame.origin.x += self.itemBOffset.x
      itemFrame.origin.y = self.itemBOffset.y
    } else {
      itemFrame.origin.x += self.itemAOffset.x
      itemFrame.origin.y = self.itemAOffset.y
    }

    let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
    attributes.frame = itemFrame

    return attributes
  }

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}
