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

#import "HomeViewController.h"

#import <MaterialComponents/MaterialAppBar.h>
// TODO: Import Themers
#import <MaterialComponents/MDCAppBarColorThemer.h>
#import <MaterialComponents/MDCAppBarTypographyThemer.h>

#import "ApplicationScheme.h"
#import "Catalog.h"
#import "CustomLayout.h"
#import "LoginViewController.h"
#import "ProductCell.h"


@interface HomeViewController ()

@property (nonatomic) BOOL shouldDisplayLogin;

// AppBar Property
@property(nonatomic, strong) MDCAppBar *appBar;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.tintColor = [UIColor blackColor];
  self.view.backgroundColor = [UIColor whiteColor];

  self.title = @"Shrine";

  // Display the Login Screen the first time this controller is shown
  [self displayLogin];

  // AppBar Init
  _appBar = [[MDCAppBar alloc] init];
  [self addChildViewController:_appBar.headerViewController];
  // Set the tracking scroll view.
  self.appBar.headerViewController.headerView.trackingScrollView = self.collectionView;
  [self.appBar addSubviewsToParent];

  // Setup Navigation Items
  UIImage *menuItemImage = [UIImage imageNamed:@"MenuItem"];
  UIImage *templatedMenuItemImage = [menuItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIBarButtonItem *menuItem =
    [[UIBarButtonItem alloc] initWithImage:templatedMenuItemImage
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(menuItemTapped:)];
  self.navigationItem.leftBarButtonItem = menuItem;

  UIImage *searchItemImage = [UIImage imageNamed:@"SearchItem"];
  UIImage *templateSearchItemImage = [searchItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIBarButtonItem *searchItem =
  [[UIBarButtonItem alloc] initWithImage:templateSearchItemImage
                                   style:UIBarButtonItemStylePlain
                                  target:nil
                                  action:nil];

  UIImage *tuneItemImage = [UIImage imageNamed:@"TuneItem"];
  UIImage *templateTuneItemImage = [tuneItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIBarButtonItem *tuneItem =
  [[UIBarButtonItem alloc] initWithImage:templateTuneItemImage
                                   style:UIBarButtonItemStylePlain
                                  target:nil
                                  action:nil];
  self.navigationItem.rightBarButtonItems = @[ tuneItem, searchItem ];

  // TODO: Theme our interface with our colors

  // TODO: Theme our interface with our typography

  // TODO: Set layout to our custom layout
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  if ([self.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
    UICollectionViewFlowLayout *flowLayout =
    (UICollectionViewFlowLayout *)self.collectionViewLayout;
    CGFloat HORIZONTAL_SPACING = 8;  // Spacing between the edges of cards
    CGFloat itemDimension = (CGRectGetWidth(self.view.frame) - 3 * HORIZONTAL_SPACING) * 0.5;
    CGSize itemSize = CGSizeMake(itemDimension, itemDimension);
    flowLayout.itemSize = itemSize;
  }

  if (self.shouldDisplayLogin) {
    LoginViewController *loginViewController =
        [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    loginViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loginViewController animated:NO completion:NULL];
    self.shouldDisplayLogin = NO;
  }
}

#pragma mark - Methods

- (void)displayLogin {
  self.shouldDisplayLogin = YES;
  if (self.isViewLoaded && self.isBeingPresented) {
    LoginViewController *loginViewController =
        [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:loginViewController animated:YES completion:NULL];
    self.shouldDisplayLogin = NO;
  }
}

- (void)menuItemTapped:(id)selector {
  LoginViewController *loginViewController =
      [[LoginViewController alloc] initWithNibName:nil bundle:nil];
  [self presentViewController:loginViewController animated:YES completion:NULL];
}

#pragma mark - UIScrollViewDelegate

// The following four methods must be forwarded to the tracking scroll view in order to implement
// the Flexible Header's behavior.

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  if (scrollView == self.appBar.headerViewController.headerView.trackingScrollView) {
    [self.appBar.headerViewController.headerView trackingScrollViewDidScroll];
  }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  if (scrollView == self.appBar.headerViewController.headerView.trackingScrollView) {
    [self.appBar.headerViewController.headerView trackingScrollViewDidEndDecelerating];
  }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  MDCFlexibleHeaderView *headerView = self.appBar.headerViewController.headerView;
  if (scrollView == headerView.trackingScrollView) {
    [headerView trackingScrollViewDidEndDraggingWillDecelerate:decelerate];
  }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset {
  MDCFlexibleHeaderView *headerView = self.appBar.headerViewController.headerView;
  if (scrollView == headerView.trackingScrollView) {
    [headerView trackingScrollViewWillEndDraggingWithVelocity:velocity
                                          targetContentOffset:targetContentOffset];
  }
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
