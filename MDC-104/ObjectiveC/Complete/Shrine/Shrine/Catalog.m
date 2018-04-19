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

#import "Catalog.h"


@interface Product ()
- (instancetype)initWithImageName:(NSString *)imageName
                      productName:(NSString *)productName
                            price:(NSString *)price
                         category:(NSString *)category;
@end

@implementation Product

- (instancetype)initWithImageName:(NSString *)imageName
                      productName:(NSString *)productName
                            price:(NSString *)price
                         category:(NSString *)category {
  self = [super init];
  if (self) {
    _imageName = [imageName copy];
    _productName = [productName copy];
    _price = [price copy];
    _category = [category copy];
  }
  return self;
}

@end

@implementation Catalog {
  NSMutableArray <Product *>*_products;
}

+ (instancetype)productCatalog {
  static Catalog *catalog;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    catalog = [[Catalog alloc] initSingleton];
  });
  return catalog;
}

- (instancetype)initSingleton {
  self = [super init];
  if (self) {
    _products = [[NSMutableArray alloc] init];

    {
      Product *product =
        [[Product alloc] initWithImageName:@"ProductBackpack"
                               productName:@"Backpack"
                                     price:@"$11.22"
                                  category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductBeachball"
                             productName:@"Beachball"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductBinoculars"
                             productName:@"Binoculars"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductBrush"
                             productName:@"Brush"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductChair"
                             productName:@"Chair"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductChucks"
                             productName:@"Chucks"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductClock"
                             productName:@"Clock"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductFishbowl"
                             productName:@"Fishbowl"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductFlippers"
                             productName:@"Flippers"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductHeels"
                             productName:@"Heels"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductHelmet"
                             productName:@"Helmet"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductLamp"
                             productName:@"Lamp"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductLawnchair"
                             productName:@"Lawnchair"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductLipstick"
                             productName:@"Lipstick"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductPen"
                             productName:@"Pen"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductPopsicle"
                             productName:@"Popsicle"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductRadio"
                             productName:@"Radio"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductShoes"
                             productName:@"Shoes"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductSunnies"
                             productName:@"Sunnies"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductSurfboard"
                             productName:@"Surfboard"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductTeapot"
                             productName:@"Teapot"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductTools"
                             productName:@"Tools"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductTypewriter"
                             productName:@"Typewriter"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"ProductUmbrella"
                             productName:@"Umbrella"
                                   price:@"$11.22"
                                category:@""];
      [_products addObject:product];
    }

    _categoryFilter = @"";
  }
  return self;
}

- (Product *)productAtIndex:(NSUInteger)index {
  if (index >= _products.count) {
    NSAssert(0, @"Invalid Product Index");
    return nil;
  }

  return _products[index];
}

- (NSUInteger)count {
  return _products.count;
}

@end
