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

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zip;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)saveDidTouch:(id)sender {
  [self.view endEditing:YES];

  UIAlertController *saveAlert = [UIAlertController alertControllerWithTitle:@"Do you accept these terms?" message:kLorem preferredStyle:UIAlertControllerStyleAlert];
  [saveAlert addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    self.name.text = nil;
    self.address.text = nil;
    self.city.text = nil;
    self.state.text = nil;
    self.zip.text = nil;
  }]];
  [saveAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
  }]];
  [self presentViewController:saveAlert animated:YES completion:nil];
}

@end
