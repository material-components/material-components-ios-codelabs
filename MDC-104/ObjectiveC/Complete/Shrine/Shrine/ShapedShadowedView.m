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

#import "ShapedShadowedView.h"

#import <MaterialComponents/MDCCutCornerTreatment.h>
#import <MaterialComponents/MDCRectangleShapeGenerator.h>
#import <MaterialComponents/MDCRoundedCornerTreatment.h>
#import <MaterialComponents/MDCShapedShadowLayer.h>

#import "ApplicationScheme.h"

@implementation ShapedShadowedView

+ (Class)layerClass {
  return [MDCShapedShadowLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self commonShapedShadowedViewInit];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self commonShapedShadowedViewInit];
  }
  return self;
}

- (void)commonShapedShadowedViewInit {
  MDCShapedShadowLayer *shapedShadowedLayer = (MDCShapedShadowLayer *)self.layer;
  MDCRectangleShapeGenerator *shapeGenerator = [[MDCRectangleShapeGenerator alloc] init];
  // TODO: Change the corner treatment to be cut @ 20px
  shapeGenerator.topLeftCorner = [[MDCCutCornerTreatment alloc] initWithCut:20.0];
  shapedShadowedLayer.shapeGenerator = shapeGenerator;
  shapedShadowedLayer.shadowOffset = CGSizeMake(0.0, 0.0);
  shapedShadowedLayer.shadowRadius = 4.0;
  shapedShadowedLayer.shadowOpacity = 0.8;
  shapedShadowedLayer.shapedBackgroundColor =
      [ApplicationScheme sharedInstance].colorScheme.surfaceColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
  MDCShapedShadowLayer *shapedShadowedLayer = (MDCShapedShadowLayer *)self.layer;
  shapedShadowedLayer.shapedBackgroundColor = backgroundColor;
}

@end
