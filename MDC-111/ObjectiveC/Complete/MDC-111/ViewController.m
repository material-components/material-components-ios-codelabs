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
#import "MaterialTextFields+ColorThemer.h"
#import "MaterialTextFields+TypographyThemer.h"
#import "MaterialButtons.h"
#import "MaterialButtons+ButtonThemer.h"
#import "MaterialDialogs.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic) MDCTextInputControllerOutlined *nameController;
@property (nonatomic) MDCTextInputControllerOutlined *addressController;
@property (nonatomic) MDCTextInputControllerOutlined *cityController;
@property (nonatomic) MDCTextInputControllerOutlined *stateController;
@property (nonatomic) MDCTextInputControllerOutlined *zipController;

@property (weak, nonatomic) IBOutlet MDCTextField *name;
@property (weak, nonatomic) IBOutlet MDCTextField *address;
@property (weak, nonatomic) IBOutlet MDCTextField *city;
@property (weak, nonatomic) IBOutlet MDCTextField *state;
@property (weak, nonatomic) IBOutlet MDCTextField *zip;

@property (weak, nonatomic) IBOutlet MDCButton *saveButton;


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // TODO: Instantiate controllers
  self.nameController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.name];
  self.addressController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.address];
  self.cityController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.city];
  self.stateController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.state];
  self.zipController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.zip];

  [MDCContainedButtonThemer applyScheme:[[MDCButtonScheme alloc] init] toButton:self.saveButton];

  MDCSemanticColorScheme *colorScheme = [[MDCSemanticColorScheme alloc] init];
  [MDCTextFieldColorThemer applySemanticColorScheme:colorScheme toTextInputController:self.nameController];
  [MDCTextFieldColorThemer applySemanticColorScheme:colorScheme toTextInputController:self.addressController];
  [MDCTextFieldColorThemer applySemanticColorScheme:colorScheme toTextInputController:self.cityController];
  [MDCTextFieldColorThemer applySemanticColorScheme:colorScheme toTextInputController:self.stateController];
  [MDCTextFieldColorThemer applySemanticColorScheme:colorScheme toTextInputController:self.zipController];
  MDCTypographyScheme *typographyScheme = [[MDCTypographyScheme alloc] init];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme toTextInputController:self.nameController];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme toTextInputController:self.addressController];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme toTextInputController:self.cityController];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme toTextInputController:self.stateController];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme toTextInputController:self.zipController];

  self.zip.delegate = self;
}

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

// TODO: Override viewDidLayoutSubviews()
- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  CGFloat verticalInset = MIN(0, (CGRectGetHeight(self.saveButton.bounds) - 48) / 2);
  self.saveButton.hitAreaInsets = UIEdgeInsetsMake(verticalInset, 0, verticalInset, 0);
}

#pragma mark - UITextFieldDelegate methods

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
