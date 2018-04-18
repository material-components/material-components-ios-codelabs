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

#import "ApplicationScheme.h"
#import "HomeViewController.h"
#import "LoginViewController.h"

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


@property(nonatomic) UIViewController *embeddedViewController;
@property(nonatomic) UIView *embeddedView;

@end

@implementation BackdropViewController {
  BOOL _focusedEmbeddedController;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [ApplicationScheme scheme].surfaceColor;

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
  [MDCAppBarColorThemer applySemanticColorScheme:[ApplicationScheme scheme] toAppBar:_appBar];
  self.appBar.navigationBar.translatesAutoresizingMaskIntoConstraints = NO;

  // Button Init
  self.featuredButton = [[MDCFlatButton alloc] init];
  self.featuredButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.featuredButton setTitle:@"FEATURED" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.featuredButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.featuredButton];
  [self.view addSubview:self.featuredButton];

  self.apartmentButton = [[MDCFlatButton alloc] init];
  self.apartmentButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.apartmentButton setTitle:@"APARTMENT" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.apartmentButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.apartmentButton];
  [self.view addSubview:self.apartmentButton];

  self.accessoriesButton = [[MDCFlatButton alloc] init];
  self.accessoriesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.accessoriesButton setTitle:@"ACCESSORIES" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.accessoriesButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.accessoriesButton];
  [self.view addSubview:self.accessoriesButton];

  self.shoesButton = [[MDCFlatButton alloc] init];
  self.shoesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.shoesButton setTitle:@"SHOES" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.shoesButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.shoesButton];
  [self.view addSubview:self.shoesButton];

  self.topsButton = [[MDCFlatButton alloc] init];
  self.topsButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.topsButton setTitle:@"TOPS" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.topsButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.topsButton];
  [self.view addSubview:self.topsButton];

  self.bottomsButton = [[MDCFlatButton alloc] init];
  self.bottomsButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.bottomsButton setTitle:@"BOTTOMS" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.bottomsButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.bottomsButton];
  [self.view addSubview:self.bottomsButton];

  self.dressesButton = [[MDCFlatButton alloc] init];
  self.dressesButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.dressesButton setTitle:@"DRESSES" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.dressesButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.dressesButton];
  [self.view addSubview:self.dressesButton];

  self.accountButton = [[MDCFlatButton alloc] init];
  self.accountButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.accountButton setTitle:@"MY ACCOUNT" forState:UIControlStateNormal];
  [MDCButtonColorThemer applySemanticColorScheme:[ApplicationScheme scheme]
                                    toFlatButton:self.accountButton];
  [MDCButtonTypographyThemer applyTypographyScheme:[ApplicationScheme scheme]
                                          toButton:self.accountButton];
  [self.view addSubview:self.accountButton];

  NSMutableArray <NSLayoutConstraint *> *constraints = [[NSMutableArray alloc] init];

//  NSLayoutConstraint *navbarTopConstraint =
//  [NSLayoutConstraint constraintWithItem:self.appBar.navigationBar
//                               attribute:NSLayoutAttributeTop
//                               relatedBy:NSLayoutRelationEqual
//                                  toItem:self.view
//                               attribute:NSLayoutAttributeTop
//                              multiplier:1
//                                constant:0];
//  [constraints addObject:navbarTopConstraint];
//
//  NSLayoutConstraint *navbarHeightConstraint =
//  [NSLayoutConstraint constraintWithItem:self.appBar.navigationBar
//                               attribute:NSLayoutAttributeHeight
//                               relatedBy:NSLayoutRelationEqual
//                                  toItem:nil
//                               attribute:NSLayoutAttributeNotAnAttribute
//                              multiplier:1
//                                constant:72];
//  [constraints addObject:navbarHeightConstraint];
//
//  NSLayoutConstraint *navbarWidthConstraint =
//  [NSLayoutConstraint constraintWithItem:self.appBar.navigationBar
//                               attribute:NSLayoutAttributeWidth
//                               relatedBy:NSLayoutRelationEqual
//                                  toItem:self.view
//                               attribute:NSLayoutAttributeWidth
//                              multiplier:1
//                                constant:0];
//  [constraints addObject:navbarWidthConstraint];

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

  // Setup embedded view
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
  [self insertController:viewController];
}

#pragma mark - UIViewController

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  CGRect embeddedFrame = CGRectStandardize(self.view.bounds);
  UIEdgeInsets insetHeader = UIEdgeInsetsZero;
  insetHeader.top = CGRectGetMaxY(self.appBar.headerViewController.view.frame);
  embeddedFrame = UIEdgeInsetsInsetRect(embeddedFrame, insetHeader);

  if (self.isFocusedEmbeddedController) {
    embeddedFrame.origin.y = CGRectStandardize(self.view.bounds).size.height -
    CGRectGetHeight(self.appBar.navigationBar.frame);
  }

  self.embeddedView.frame = embeddedFrame;
}

- (BOOL)isFocusedEmbeddedController {
  return _focusedEmbeddedController;
}

- (void)setFocusedEmbeddedController:(BOOL)focusedEmbeddedController {
  _focusedEmbeddedController = focusedEmbeddedController;
  [self.view setNeedsLayout];
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

#pragma mark - Controller Containment

- (void)insertController:(UIViewController *)viewController {
  if (self.embeddedViewController) {
    [self.embeddedViewController willMoveToParentViewController:nil];
    [self.embeddedViewController removeFromParentViewController];
    self.embeddedViewController = nil;

    [self.embeddedView removeFromSuperview];
    self.embeddedView = nil;
  }
  if (viewController) {
    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];
    self.embeddedViewController = viewController;

    [self.view addSubview:viewController.view];
    self.embeddedView = viewController.view;
  }
}

- (void)removeController {

}

@end
