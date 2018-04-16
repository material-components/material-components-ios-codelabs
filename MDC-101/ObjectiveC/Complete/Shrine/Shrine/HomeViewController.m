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

#import "LoginViewController.h"


@interface HomeViewController ()

@property (nonatomic) BOOL shouldDisplayLogin;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.tintColor = [UIColor blackColor];
  self.view.backgroundColor = [UIColor whiteColor];

  self.title = @"Shrine";

  // Done Label
  UILabel *doneLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  doneLabel.translatesAutoresizingMaskIntoConstraints = NO;
  doneLabel.text = @"You did it!";
  [self.view addSubview:doneLabel];
  [doneLabel sizeToFit];
  [NSLayoutConstraint constraintWithItem:doneLabel
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1
                                constant:0].active = YES;
  [NSLayoutConstraint constraintWithItem:doneLabel
                               attribute:NSLayoutAttributeCenterY
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterY
                              multiplier:1
                                constant:0].active = YES;

  // Display the Login Screen the first time this controller is shown
  [self displayLogin];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

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

@end
