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

#import "ViewController.h"
#import "Lorem.h"

#import "MaterialTextFields.h"
#import "MaterialButtons.h"
#import "MaterialDialogs.h"
#import "MaterialButtons+ButtonThemer.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet MDCTextField *name;
@property (weak, nonatomic) IBOutlet MDCTextField *address;
@property (weak, nonatomic) IBOutlet MDCTextField *city;
@property (weak, nonatomic) IBOutlet MDCTextField *state;
@property (weak, nonatomic) IBOutlet MDCTextField *zip;


@property (nonatomic) MDCTextInputControllerOutlined *nameController;
@property (nonatomic) MDCTextInputControllerOutlined *addressController;
@property (nonatomic) MDCTextInputControllerOutlined *cityController;
@property (nonatomic) MDCTextInputControllerOutlined *stateController;
@property (nonatomic) MDCTextInputControllerOutlined *zipController;

@property (weak, nonatomic) IBOutlet MDCButton *saveButton;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.nameController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.name];
  self.addressController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.address];
  self.cityController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.city];
  self.stateController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.state];
  self.zipController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.zip];

  [MDCContainedButtonThemer applyScheme:[[MDCButtonScheme alloc] init] toButton:self.saveButton];

  self.zip.delegate = self;
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  self.saveButton.hitAreaInsets = UIEdgeInsetsMake((48 - self.saveButton.bounds.size.height) / -2, 0, (48 - self.saveButton.bounds.size.height) / -2, 0);
}
#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSString *finishedString =
    [textField.text stringByReplacingCharactersInRange:range withString:string];

  if (textField == self.zip) {
    if ([finishedString rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].length > 0) {
      [self.zipController setErrorText:@"Error: Zip can only contain numbers"
               errorAccessibilityValue:nil];
    } else {
      [self.zipController setErrorText:nil errorAccessibilityValue:nil];
    }
  }
  return YES;
}

#pragma mark - Target / Action

- (IBAction)saveDidTouch:(id)sender {
  [self.view endEditing:YES];

  MDCAlertController *saveAlert = [MDCAlertController alertControllerWithTitle:@"Do you accept these terms?" message:kLorem];
  [saveAlert addAction:[MDCAlertAction actionWithTitle:@"Yes" handler:^(MDCAlertAction * _Nonnull action) {
    self.name.text = nil;
    self.address.text = nil;
    self.city.text = nil;
    self.state.text = nil;
    self.zip.text = nil;
  }]];
  [saveAlert addAction:[MDCAlertAction actionWithTitle:@"Cancel" handler:^(MDCAlertAction * _Nonnull action) {
  }]];
  [self presentViewController:saveAlert animated:YES completion:nil];
}

@end
