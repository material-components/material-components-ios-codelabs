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

#import "CustomLayout.h"

@interface CustomLayout ()

@property (nonatomic) CGSize itemASize;
@property (nonatomic) CGSize itemBSize;
@property (nonatomic) CGSize itemCSize;

@property (nonatomic) CGPoint itemAOffset;
@property (nonatomic) CGPoint itemBOffset;
@property (nonatomic) CGPoint itemCOffset;

@property (nonatomic) CGSize tripleSize;

@property (nonatomic) NSMutableArray<NSValue *> *frameCache;

@end

static CGFloat HORIZONTAL_PADDING = .10;

@implementation CustomLayout

- (instancetype)init {
  self = [super init];
  if (self) {
    self.frameCache = [[NSMutableArray alloc] init];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    self.frameCache = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)prepareLayout {
  [super prepareLayout];

  CGRect parentFrame = CGRectStandardize(self.collectionView.bounds);
  parentFrame = UIEdgeInsetsInsetRect(parentFrame, self.collectionView.adjustedContentInset);
  CGFloat contentHeight = CGRectGetHeight(parentFrame) -
      (self.collectionView.contentInset.top + self.collectionView.contentInset.bottom);
  CGFloat contentWidth = CGRectGetWidth(parentFrame);

  CGSize landscapeItemSize = CGSizeMake(contentWidth * .46, contentHeight * .32);
  CGSize portraitItemSize = CGSizeMake(contentWidth * .32, contentHeight * .54);

  self.itemASize = landscapeItemSize;
  self.itemBSize = landscapeItemSize;
  self.itemCSize = portraitItemSize;

  self.itemAOffset = CGPointMake(contentWidth * HORIZONTAL_PADDING, contentHeight * .66);
  self.itemBOffset = CGPointMake(contentWidth * .3, contentHeight * .16);
  self.itemCOffset = CGPointMake(self.itemBOffset.x + self.itemBSize.width + contentWidth * HORIZONTAL_PADDING, contentHeight * .2);

  self.tripleSize = CGSizeMake(self.itemCOffset.x + self.itemCSize.width, contentHeight);

  [self.frameCache removeAllObjects];
  for (NSInteger itemIndex = 0; itemIndex < [self.collectionView numberOfItemsInSection:0]; itemIndex++) {
    NSInteger tripleCount = itemIndex / 3;
    NSInteger internalIndex = itemIndex % 3;

    CGRect itemFrame = CGRectZero;
    if (internalIndex == 2) {
      itemFrame.size = self.itemCSize;
    } else if (internalIndex == 1) {
      itemFrame.size = self.itemBSize;
    } else {
      itemFrame.size = self.itemASize;
    }

    itemFrame.origin.x = self.tripleSize.width * tripleCount;
    if (internalIndex == 2) {
      itemFrame.origin.x += self.itemCOffset.x;
      itemFrame.origin.y = self.itemCOffset.y;
    } else if (internalIndex == 1) {
      itemFrame.origin.x += self.itemBOffset.x;
      itemFrame.origin.y = self.itemBOffset.y;
    } else {
      itemFrame.origin.x += self.itemAOffset.x;
      itemFrame.origin.y = self.itemAOffset.y;
    }

    NSValue *frameValue = [NSValue valueWithCGRect:itemFrame];
    [self.frameCache addObject:frameValue];
  }
}
- (CGSize)collectionViewContentSize {
  CGSize contentSize = CGSizeZero;
  contentSize.height = self.tripleSize.height;
  NSValue *lastItemFrameValue = self.frameCache.lastObject;
  CGRect lastItemFrame = lastItemFrameValue.CGRectValue;
  contentSize.width = CGRectGetMaxX(lastItemFrame) +
    HORIZONTAL_PADDING * CGRectGetWidth(self.collectionView.frame);

  return contentSize;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
  NSMutableArray<UICollectionViewLayoutAttributes *> *visibleLayoutAttributes =
      [[NSMutableArray alloc] init];

  for (NSInteger itemIndex = 0; itemIndex < self.frameCache.count; ++itemIndex) {
    NSValue *rectValue = self.frameCache[itemIndex];
    CGRect itemFrame = rectValue.CGRectValue;
    if (CGRectIntersectsRect(itemFrame, rect)) {
      NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemIndex inSection:0];
      UICollectionViewLayoutAttributes *attributes =
        [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
      attributes.frame = itemFrame;
      [visibleLayoutAttributes addObject:attributes];
    }
  }

  return visibleLayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger tripleCount = indexPath.row / 3;
  NSInteger internalIndex = indexPath.row % 3;

  CGRect itemFrame = CGRectZero;
  if (internalIndex == 2) {
    itemFrame.size = self.itemCSize;
  } else if (internalIndex == 1) {
    itemFrame.size = self.itemBSize;
  } else {
    itemFrame.size = self.itemASize;
  }

  itemFrame.origin.x = self.tripleSize.width * tripleCount;
  if (internalIndex == 2) {
    itemFrame.origin.x += self.itemCOffset.x;
    itemFrame.origin.y = self.itemCOffset.y;
  } else if (internalIndex == 1) {
    itemFrame.origin.x += self.itemBOffset.x;
    itemFrame.origin.y = self.itemBOffset.y;
  } else {
    itemFrame.origin.x += self.itemAOffset.x;
    itemFrame.origin.y = self.itemAOffset.y;
  }

  UICollectionViewLayoutAttributes *attributes =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
  attributes.frame = itemFrame;

  return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
  return YES;
}

@end
