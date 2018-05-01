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

#import "BackdropViewController.h"

#import <MaterialComponents/MaterialAppBar.h>
#import <MaterialComponents/MaterialButtons.h>
#import <MaterialComponents/MaterialNavigationBar.h>
#import <MaterialComponents/MDCAppBarColorThemer.h>
#import <MaterialComponents/MDCButtonColorThemer.h>
#import <MaterialComponents/MDCButtonTypographyThemer.h>
#import <MaterialComponents/MDCNavigationBarColorThemer.h>
#import <MaterialComponents/MDCNavigationBarTypographyThemer.h>
#import <MaterialComponents/MDCShapedShadowLayer.h>

#import "ApplicationScheme.h"
#import "Catalog.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
#import "ShapedShadowedView.h"

@interface BackdropViewController ()

// AppBar Property
@property(nonatomic) MDCAppBar *appBar;

// NavigationBar Property
@property(nonatomic) MDCNavigationBar *navigationBar;

// Button Properties
@property(nonatomic) MDCFlatButton *featuredButton;
@property(nonatomic) MDCFlatButton *apartmentButton;
@property(nonatomic) MDCFlatButton *accessoriesButton;
@property(nonatomic) MDCFlatButton *shoesButton;
@property(nonatomic) MDCFlatButton *topsButton;
@property(nonatomic) MDCFlatButton *bottomsButton;
@property(nonatomic) MDCFlatButton *dressesButton;
@property(nonatomic) MDCFlatButton *accountButton;

// Is embedded controller in the foreground / focused
@property(nonatomic, getter=isFocusedEmbeddedController) BOOL focusedEmbeddedController;

@property(nonatomic) UIView *containerView;

@property(nonatomic) UIViewController *embeddedViewController;
@property(nonatomic) UIView *embeddedView;

@end

@implementation BackdropViewController {
  BOOL _focusedEmbeddedController;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [ApplicationScheme sharedInstance].colorScheme.surfaceColor;

  self.title = @"Shrine";

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
                                  target:self
                                  action:@selector(filterItemTapped:)];

  UIImage *tuneItemImage = [UIImage imageNamed:@"TuneItem"];
  UIImage *templateTuneItemImage = [tuneItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIBarButtonItem *tuneItem =
  [[UIBarButtonItem alloc] initWithImage:templateTuneItemImage
                                   style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(filterItemTapped:)];
  self.navigationItem.rightBarButtonItems = @[ tuneItem, searchItem ];

  // NavigationBar Init
  _appBar = [[MDCAppBar alloc] init];
  [self addChildViewController:_appBar.headerViewController];
  [self.appBar addSubviewsToParent];
    self.view.backgroundColor = [ApplicationScheme sharedInstance].colorScheme.surfaceColor;
[MDCAppBarColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme toAppBar:_appBar];
  self.appBar.navigationBar.translatesAutoresizingMaskIntoConstraints = NO;

  // Button Init
  self.featuredButton = [[MDCFlatButton alloc] init];
  self.featuredButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.featuredButton setTitle:@"FEATURED" forState:UIControlStateNormal];
  [self.featuredButton addTarget:self
                          action:@selector(categoryTapped:)
                forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.featuredButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.featuredButton];
  [self.view addSubview:self.featuredButton];

  self.apartmentButton = [[MDCFlatButton alloc] init];
  self.apartmentButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.apartmentButton setTitle:@"APARTMENT" forState:UIControlStateNormal];
  [self.apartmentButton addTarget:self
                           action:@selector(categoryTapped:)
                 forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.apartmentButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.apartmentButton];
  [self.view addSubview:self.apartmentButton];

  self.accessoriesButton = [[MDCFlatButton alloc] init];
  self.accessoriesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.accessoriesButton setTitle:@"ACCESSORIES" forState:UIControlStateNormal];
  [self.accessoriesButton addTarget:self
                             action:@selector(categoryTapped:)
                   forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.accessoriesButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.accessoriesButton];
  [self.view addSubview:self.accessoriesButton];

  self.shoesButton = [[MDCFlatButton alloc] init];
  self.shoesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.shoesButton setTitle:@"SHOES" forState:UIControlStateNormal];
  [self.shoesButton addTarget:self
                       action:@selector(categoryTapped:)
             forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.shoesButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.shoesButton];
  [self.view addSubview:self.shoesButton];

  self.topsButton = [[MDCFlatButton alloc] init];
  self.topsButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.topsButton setTitle:@"TOPS" forState:UIControlStateNormal];
  [self.topsButton addTarget:self
                      action:@selector(categoryTapped:)
            forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.topsButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.topsButton];
  [self.view addSubview:self.topsButton];

  self.bottomsButton = [[MDCFlatButton alloc] init];
  self.bottomsButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.bottomsButton setTitle:@"BOTTOMS" forState:UIControlStateNormal];
  [self.bottomsButton addTarget:self
                         action:@selector(categoryTapped:)
               forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.bottomsButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.bottomsButton];
  [self.view addSubview:self.bottomsButton];

  self.dressesButton = [[MDCFlatButton alloc] init];
  self.dressesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.dressesButton setTitle:@"DRESSES" forState:UIControlStateNormal];
  [self.dressesButton addTarget:self
                         action:@selector(categoryTapped:)
               forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.dressesButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.dressesButton];
  [self.view addSubview:self.dressesButton];

  self.accountButton = [[MDCFlatButton alloc] init];
  self.accountButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.accountButton setTitle:@"MY ACCOUNT" forState:UIControlStateNormal];
  [self.accountButton addTarget:self
                         action:@selector(accountTapped:)
               forControlEvents:UIControlEventTouchUpInside];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme
                                    toFlatButton:self.accountButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme sharedInstance].typographyScheme
                                          toButton:self.accountButton];
  [self.view addSubview:self.accountButton];

  NSMutableArray <NSLayoutConstraint *> *constraints = [[NSMutableArray alloc] init];

  [constraints addObject:[NSLayoutConstraint constraintWithItem:self.featuredButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

  NSDictionary *nameView = @{
                             @"navigationbar" : self.appBar.navigationBar,
                             @"featured" : self.featuredButton,
                             @"apartment" : self.apartmentButton,
                             @"accessories" : self.accessoriesButton,
                             @"shoes" : self.shoesButton,
                             @"tops" : self.topsButton,
                             @"bottoms" : self.bottomsButton,
                             @"dresses" : self.dressesButton,
                             @"account" : self.accountButton,
                             };
  [constraints addObjectsFromArray:[NSLayoutConstraint
                                    constraintsWithVisualFormat:@"V:|[navigationbar]-[featured]-[apartment]-[accessories]-[shoes]-[tops]-[bottoms]-[dresses]-[account]"
                                    options:NSLayoutFormatAlignAllCenterX
                                    metrics:nil
                                    views:nameView]];
  [NSLayoutConstraint activateConstraints:constraints];

  UITapGestureRecognizer *recognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(filterItemTapped:)];
  [self.view addGestureRecognizer:recognizer];

  //TODO: Change the container view into a ShapedShadowedView
  self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
  self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
  self.containerView.backgroundColor = UIColor.whiteColor;
  [self.view addSubview:self.containerView];

  //TODO: Embed the catalog view controller in the BackdropViewController
}

#pragma mark - UIViewController

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  CGRect embeddedFrame = [self frameForEmbeddedController];
  self.containerView.frame = embeddedFrame;
  self.embeddedView.frame = self.containerView.bounds;
}

- (BOOL)isFocusedEmbeddedController {
  return _focusedEmbeddedController;
}

- (void)setFocusedEmbeddedController:(BOOL)focusedEmbeddedController {
  _focusedEmbeddedController = focusedEmbeddedController;
  [UIView animateWithDuration:0.20 animations:^(){
    self.containerView.frame = [self frameForEmbeddedController];
  }];
}

- (CGRect)frameForEmbeddedController {
  CGRect embeddedFrame = CGRectStandardize(self.view.bounds);
  UIEdgeInsets insetHeader = UIEdgeInsetsZero;
  insetHeader.top = CGRectGetMaxY(self.appBar.headerViewController.view.frame);
  embeddedFrame = UIEdgeInsetsInsetRect(embeddedFrame, insetHeader);

  // If the embedded controller is not focused, move to the bottom of the interface
  if (!self.isFocusedEmbeddedController) {
    embeddedFrame.origin.y = CGRectStandardize(self.view.bounds).size.height -
        CGRectGetHeight(self.appBar.navigationBar.frame);
  }

  // If we don't have an embedded view, locate the view offscreen
  if (!self.embeddedView) {
    embeddedFrame.origin.y = CGRectGetMaxY(self.view.bounds);
  }

  return embeddedFrame;
}

#pragma mark - Action Methods

- (void)menuItemTapped:(id)selector {
  LoginViewController *loginViewController =
      [[LoginViewController alloc] initWithNibName:nil bundle:nil];
  [self presentViewController:loginViewController animated:YES completion:NULL];
}

- (void)filterItemTapped:(id)selector {
  // Toggle CatalogView
  self.focusedEmbeddedController = !self.isFocusedEmbeddedController;
}

- (void)categoryTapped:(id)selector {
  NSString *filter = @"";
  if (selector == self.featuredButton) {
    filter = @"";  // Intentionally set to blank so all products are shown
  } else if (selector == self.apartmentButton) {
    filter = @"apartment";
  } else if (selector == self.accessoriesButton) {
    filter = @"accessories";
  } else if (selector == self.shoesButton) {
    filter = @"shoes";
  } else if (selector == self.topsButton) {
    filter = @"tops";
  } else if (selector == self.bottomsButton) {
    filter = @"bottoms";
  } else if (selector == self.dressesButton) {
    filter = @"dresses";
  }

  [Catalog productCatalog].categoryFilter = filter;

  // Toggle CatalogView
  self.focusedEmbeddedController = !self.isFocusedEmbeddedController;
}

- (void)accountTapped:(id)selector {
  LoginViewController *loginViewController =
  [[LoginViewController alloc] initWithNibName:nil bundle:nil];
  [self presentViewController:loginViewController animated:YES completion:NULL];
}

#pragma mark - Controller Containment

- (void)insertController:(UIViewController *)viewController {
  if (self.embeddedViewController) {
    [self.embeddedViewController willMoveToParentViewController:nil];
    [self.embeddedViewController removeFromParentViewController];
    self.embeddedViewController = nil;

    [self.embeddedView removeFromSuperview];
    self.embeddedView = nil;
    _focusedEmbeddedController = NO;
  }
  if (viewController) {
    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];
    self.embeddedViewController = viewController;

    [self.containerView addSubview:viewController.view];
    self.embeddedView = viewController.view;
    if ([self.containerView.layer isKindOfClass:[MDCShapedShadowLayer class]]) {
      MDCShapedShadowLayer *shapedShadowLayer = (MDCShapedShadowLayer *)self.containerView.layer;
      self.embeddedView.layer.mask = shapedShadowLayer.shapeLayer;
    }

    _focusedEmbeddedController = YES;
  }
}

- (void)removeController {
  if (self.embeddedViewController) {
    [self.embeddedViewController willMoveToParentViewController:nil];
    [self.embeddedViewController removeFromParentViewController];
    self.embeddedViewController = nil;

    [self.embeddedView removeFromSuperview];
    self.embeddedView = nil;
    _focusedEmbeddedController = NO;
  }
}

@end
