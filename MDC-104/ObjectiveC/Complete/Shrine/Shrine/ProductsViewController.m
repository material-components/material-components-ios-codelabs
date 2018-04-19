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

#import "ProductsViewController.h"

#import "ApplicationScheme.h"
#import "Catalog.h"
#import "CustomLayout.h"
#import "ProductCell.h"
#import "ShapedShadowedView.h"

@interface ProductsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [ApplicationScheme scheme].surfaceColor;
  self.collectionView.backgroundColor = [ApplicationScheme scheme].surfaceColor;
}

- (void)viewWillLayoutSubviews {
  CGFloat CORNER_CUT_INSET = 20.0;
  CGRect collectionFrame = CGRectStandardize(self.view.bounds);
  collectionFrame.origin.y += CORNER_CUT_INSET;
  collectionFrame.size.height -= CORNER_CUT_INSET;
  self.collectionView.frame = collectionFrame;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return [Catalog productCatalog].count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  ProductCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];

  // Set the properties of the cell to reflect the product from the model
  Product *product = [[Catalog productCatalog] productAtIndex:indexPath.row];
  UIImage *productImage = [UIImage imageNamed:product.imageName];
  cell.imageView.image = productImage;
  cell.nameLabel.text = product.productName;
  cell.priceLabel.text = product.price;

  return cell;
}

@end
