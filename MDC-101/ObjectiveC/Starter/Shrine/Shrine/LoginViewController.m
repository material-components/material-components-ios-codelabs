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

#import "LoginViewController.h"

//TODO: Add MaterialButtons #import
//TODO: Add MaterialTextFields #import

@interface LoginViewController () <UITextFieldDelegate>

@property(nonatomic) UIScrollView *scrollView;

@property(nonatomic) UILabel *titleLabel;
@property(nonatomic) UIImageView *logoImageView;

// Text Field Properties
//TODO: Add Text Field Properties

// Button Properties
//TODO: Add Button Properties

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self registerKeyboardNotifications];

  self.view.tintColor = [UIColor blackColor];
  self.view.backgroundColor = [UIColor whiteColor];

  self.title = @"Login";

  self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  self.scrollView.backgroundColor = [UIColor whiteColor];
  UIEdgeInsets margins = UIEdgeInsetsMake(0, 16, 0, 16);
  self.scrollView.layoutMargins = margins;
  [self.view addSubview:self.scrollView];

  [NSLayoutConstraint
   activateConstraints:[NSLayoutConstraint
                        constraintsWithVisualFormat:@"V:|[scrollView]|"
                        options:0
                        metrics:nil
                        views:@{
                                @"scrollView" : self.scrollView
                                }]];
  [NSLayoutConstraint
   activateConstraints:[NSLayoutConstraint
                        constraintsWithVisualFormat:@"H:|[scrollView]|"
                        options:0
                        metrics:nil
                        views:@{
                                @"scrollView" : self.scrollView
                                }]];

  UITapGestureRecognizer *tapGestureRecognizer =
  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDidTouch:)];
  [self.scrollView addGestureRecognizer:tapGestureRecognizer];

  // Logo Init
  UIImage *logoImage = [UIImage imageNamed:@"ShrineLogo"];
  UIImage *templatedLogoImage =
  [logoImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  self.logoImageView = [[UIImageView alloc] initWithImage:templatedLogoImage];
  self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.scrollView addSubview:self.logoImageView];

  // Title Init
  self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  self.titleLabel.text = @"SHRINE";
  [self.titleLabel sizeToFit];
  [self.scrollView addSubview:self.titleLabel];

  // Text Field Init
  //TODO: Instantiate Text Fields

  // Button Init
  //TODO: Instantiate Buttons

  // Layout Constraints
  NSMutableArray <NSLayoutConstraint *> *constraints = [[NSMutableArray alloc] init];

  NSLayoutConstraint *logoTopConstraint =
  [NSLayoutConstraint constraintWithItem:self.logoImageView
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.scrollView.contentLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:49];
  [constraints addObject:logoTopConstraint];

  NSLayoutConstraint *centerLogoConstraint =
  [NSLayoutConstraint constraintWithItem:self.logoImageView
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.scrollView
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1.f constant:0.f];
  [constraints addObject:centerLogoConstraint];

  NSLayoutConstraint *titleTopConstraint =
  [NSLayoutConstraint constraintWithItem:self.titleLabel
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.logoImageView
                               attribute:NSLayoutAttributeBottom
                              multiplier:1
                                constant:22];
  [constraints addObject:titleTopConstraint];

  NSLayoutConstraint *centerTitleConstraint =
  [NSLayoutConstraint constraintWithItem:self.titleLabel
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.scrollView
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1.f constant:0.f];
  [constraints addObject:centerTitleConstraint];

  // Text Field Constraints
  //TODO: Add Text Field Constraints

  // Button Constraints
  //TODO: Add Button Constraints

  [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - UITextFieldDelegate

//TODO: Add Text Field Validation

#pragma mark - Gesture Handling

- (void)tapDidTouch:(UIGestureRecognizer *)sender {
  [self.view endEditing:YES];
}

#pragma mark - Action Handling

// Button Action Handlers
//TODO: Add Action Handlers

#pragma mark - Keyboard Handling

- (void)registerKeyboardNotifications {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillChangeFrameNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
  NSNumber *keyboardFrameNumber = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
  CGRect keyboardFrame = keyboardFrameNumber.CGRectValue;
  self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, CGRectGetHeight(keyboardFrame), 0);
}

- (void)keyboardWillHide:(NSNotification *)notification {
  self.scrollView.contentInset = UIEdgeInsetsZero;
}

@end

