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

#import "ProductCell.h"

#import "ApplicationScheme.h"

@implementation ProductCell

- (void)configureCell {
  // Configure the cell properties
  self.backgroundColor = [UIColor whiteColor];

  self.nameLabel.font = [ApplicationScheme scheme].subtitle1;
  self.priceLabel.font = [ApplicationScheme scheme].subtitle1;
  self.nameLabel.textAlignment = NSTextAlignmentCenter;
  self.priceLabel.textAlignment = NSTextAlignmentCenter;

  self.cornerRadius = 0.0;

  [self setBorderWidth:0.0 forState:MDCCardCellStateNormal];
  [self setBorderColor:[UIColor lightGrayColor] forState:MDCCardCellStateNormal];
}

- (void)awakeFromNib {
  [super awakeFromNib];
  [self configureCell];
}

- (void)prepareForReuse {
  [super prepareForReuse];
  [self configureCell];
}

@end
