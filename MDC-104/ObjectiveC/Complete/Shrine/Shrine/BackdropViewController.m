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
#import <MaterialComponents/MDCTextButtonThemer.h>
#import <MaterialComponents/MDCContainedButtonThemer.h>
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
@property(nonatomic) MDCButton *featuredButton;
@property(nonatomic) MDCButton *clothingButton;
@property(nonatomic) MDCButton *homeButton;
@property(nonatomic) MDCButton *accessoriesButton;
@property(nonatomic) MDCButton *accountButton;

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
                                  action:@selector(didTapMenuItem:)];
  self.navigationItem.leftBarButtonItem = menuItem;

  UIImage *searchItemImage = [UIImage imageNamed:@"SearchItem"];
  UIImage *templateSearchItemImage = [searchItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIBarButtonItem *searchItem =
  [[UIBarButtonItem alloc] initWithImage:templateSearchItemImage
                                   style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(didTapFilterItem:)];

  UIImage *tuneItemImage = [UIImage imageNamed:@"TuneItem"];
  UIImage *templateTuneItemImage = [tuneItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIBarButtonItem *tuneItem =
  [[UIBarButtonItem alloc] initWithImage:templateTuneItemImage
                                   style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(didTapFilterItem:)];
  self.navigationItem.rightBarButtonItems = @[ tuneItem, searchItem ];

  // NavigationBar Init
  _appBar = [[MDCAppBar alloc] init];
  [self addChildViewController:_appBar.headerViewController];
  [self.appBar addSubviewsToParent];
    self.view.backgroundColor = [ApplicationScheme sharedInstance].colorScheme.surfaceColor;
[MDCAppBarColorThemer applySemanticColorScheme:[ApplicationScheme sharedInstance].colorScheme toAppBar:_appBar];
  self.appBar.navigationBar.translatesAutoresizingMaskIntoConstraints = NO;

  // Button Init
  self.featuredButton = [[MDCButton alloc] init];
  self.featuredButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.featuredButton setTitle:@"FEATURED" forState:UIControlStateNormal];
  [self.featuredButton addTarget:self
                          action:@selector(didTapCategory:)
                forControlEvents:UIControlEventTouchUpInside];
  [MDCTextButtonThemer applyScheme:[ApplicationScheme sharedInstance].buttonScheme
                          toButton:self.featuredButton];
  [self.view addSubview:self.featuredButton];

  self.clothingButton = [[MDCButton alloc] init];
  self.clothingButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.clothingButton setTitle:@"CLOTHING" forState:UIControlStateNormal];
  [self.clothingButton addTarget:self
                          action:@selector(didTapCategory:)
                forControlEvents:UIControlEventTouchUpInside];
  [MDCTextButtonThemer applyScheme:[ApplicationScheme sharedInstance].buttonScheme
                          toButton:self.clothingButton];
  [self.view addSubview:self.clothingButton];

  self.homeButton = [[MDCButton alloc] init];
  self.homeButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.homeButton setTitle:@"HOME" forState:UIControlStateNormal];
  [self.homeButton addTarget:self
                           action:@selector(didTapCategory:)
                 forControlEvents:UIControlEventTouchUpInside];
  [MDCTextButtonThemer applyScheme:[ApplicationScheme sharedInstance].buttonScheme
                          toButton:self.homeButton];
  [self.view addSubview:self.homeButton];

  self.accessoriesButton = [[MDCButton alloc] init];
  self.accessoriesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.accessoriesButton setTitle:@"ACCESSORIES" forState:UIControlStateNormal];
  [self.accessoriesButton addTarget:self
                             action:@selector(didTapCategory:)
                   forControlEvents:UIControlEventTouchUpInside];
  [MDCTextButtonThemer applyScheme:[ApplicationScheme sharedInstance].buttonScheme
                          toButton:self.accessoriesButton];
  [self.view addSubview:self.accessoriesButton];

  self.accountButton = [[MDCButton alloc] init];
  self.accountButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.accountButton setTitle:@"MY ACCOUNT" forState:UIControlStateNormal];
  [self.accountButton addTarget:self
                         action:@selector(didTapAccount:)
               forControlEvents:UIControlEventTouchUpInside];
  [MDCTextButtonThemer applyScheme:[ApplicationScheme sharedInstance].buttonScheme
                          toButton:self.accountButton];
  [self.view addSubview:self.accountButton];

  NSMutableArray <NSLayoutConstraint *> *constraints = [[NSMutableArray alloc] init];

  [constraints addObject:[NSLayoutConstraint constraintWithItem:self.featuredButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

  NSDictionary *nameView = @{
                             @"navigationbar" : self.appBar.navigationBar,
                             @"featured" : self.featuredButton,
                             @"clothing" : self.clothingButton,
                             @"home" : self.homeButton,
                             @"accessories" : self.accessoriesButton,
                             @"account" : self.accountButton,
                             };
  [constraints addObjectsFromArray:[NSLayoutConstraint
                                    constraintsWithVisualFormat:@"V:|[navigationbar]-[featured]-[clothing]-[home]-[accessories]-[account]"
                                    options:NSLayoutFormatAlignAllCenterX
                                    metrics:nil
                                    views:nameView]];
  [NSLayoutConstraint activateConstraints:constraints];

  UITapGestureRecognizer *recognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapFilterItem:)];
  [self.view addGestureRecognizer:recognizer];

  //TODO: Change the container view into a ShapedShadowedView and apply the shape.
  self.containerView = [[ShapedShadowedView alloc] initWithFrame:CGRectZero];
  MDCRectangleShapeGenerator *shapeGenerator = [[MDCRectangleShapeGenerator alloc] init];
  shapeGenerator.topLeftCorner =
      [ApplicationScheme sharedInstance].shapeScheme.largeComponentShape.topLeftCorner;
  ((ShapedShadowedView *)self.containerView).shapeGenerator = shapeGenerator;
  self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
  self.containerView.backgroundColor = [ApplicationScheme sharedInstance].colorScheme.surfaceColor;
  [self.view addSubview:self.containerView];

  //TODO: Instantiate and embed the catalog view controller in the BackdropViewController
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  UIViewController *viewController =
      [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
  [self insertController:viewController];
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

- (void)didTapMenuItem:(id)selector {
  LoginViewController *loginViewController =
      [[LoginViewController alloc] initWithNibName:nil bundle:nil];
  [self presentViewController:loginViewController animated:YES completion:NULL];
}

- (void)didTapFilterItem:(id)selector {
  // Toggle CatalogView
  self.focusedEmbeddedController = !self.isFocusedEmbeddedController;
}

- (void)didTapCategory:(id)selector {
  NSString *filter = @"";
  if (selector == self.featuredButton) {
    filter = @"Featured";
  } else if (selector == self.clothingButton) {
    filter = @"Clothing";
  } else if (selector == self.homeButton) {
    filter = @"Home";
  } else if (selector == self.accessoriesButton) {
    filter = @"Accessories";
  }

  //TODO: Set the catalog filter based on the button pressed
  [Catalog productCatalog].categoryFilter = filter;

  // Toggle CatalogView
  self.focusedEmbeddedController = !self.isFocusedEmbeddedController;
}

- (void)didTapAccount:(id)selector {
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
