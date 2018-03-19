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

//TODO: Import Material Header here

@interface LoginViewController () <UITextFieldDelegate>

@property(nonatomic) UIScrollView *scrollView;

@property(nonatomic) UILabel *titleLabel;
@property(nonatomic) UIImageView *logoImageView;

// Text Fields
//TODO: Add Text Field and Text Field Controller properties here

// Buttons
//TODO: Add Button properties here

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  [self registerKeyboardNotifications];

  self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  self.view.backgroundColor = [UIColor whiteColor];
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
  UIEdgeInsets margins = UIEdgeInsetsMake(0, 16, 0, 16);
  self.scrollView.layoutMargins = margins;

  UITapGestureRecognizer *tapGestureRecognizer =
  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDidTouch:)];
  [self.scrollView addGestureRecognizer:tapGestureRecognizer];

  self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  self.titleLabel.text = @"Shrine";
  [self.titleLabel sizeToFit];
  [self.scrollView addSubview:self.titleLabel];

  UIImage *logoImage = [UIImage imageNamed:@"ShrineLogo"];
  self.logoImageView = [[UIImageView alloc] initWithImage:logoImage];
  self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.scrollView addSubview:self.logoImageView];

  // Text Fields
  //TODO: Instantiate and configure your text fields here

  // Buttons
  //TODO: Instantiate and configure your buttons here

  // Layout Constraints

  NSMutableArray <NSLayoutConstraint *> *constraints = [[NSMutableArray alloc] init];

  NSLayoutConstraint *titleTopConstraint =
  [NSLayoutConstraint constraintWithItem:self.titleLabel
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.scrollView.contentLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:40];
  [constraints addObject:titleTopConstraint];

  NSLayoutConstraint *centerTitleConstraint =
    [NSLayoutConstraint constraintWithItem:self.titleLabel
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.scrollView
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1.f constant:0.f];
  [constraints addObject:centerTitleConstraint];

  NSLayoutConstraint *logoTopConstraint =
  [NSLayoutConstraint constraintWithItem:self.logoImageView
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.titleLabel
                               attribute:NSLayoutAttributeBottom
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

  //TODO: Add text field constraints here
  //TODO: Add button constraints here

  [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];

  //TODO: Add password text field validation here

  return NO;
}

#pragma mark - Gesture Handling

- (void)tapDidTouch:(UIGestureRecognizer *)sender {
  [self.view endEditing:YES];
}

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

- (void)keyboardWillShow:(NSNotification *)notif {
  CGRect keyboardFrame = [notif.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, CGRectGetHeight(keyboardFrame), 0);
}

- (void)keyboardWillHide:(NSNotification *)notif {
  self.scrollView.contentInset = UIEdgeInsetsZero;
}



@end
