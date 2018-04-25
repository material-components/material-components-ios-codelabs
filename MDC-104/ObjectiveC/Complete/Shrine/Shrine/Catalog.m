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

NSString *const CatalogFilterDidChangeNotification = @"CatalogFilterDidChangeNotification";


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
  NSMutableArray <Product *>*_allProducts;
  NSArray <Product *>*_filteredProducts;
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
    _allProducts = [[NSMutableArray alloc] init];

    {
      Product *product =
        [[Product alloc] initWithImageName:@"Product0"
                               productName:@"Vagabond sack"
                                     price:@"$120"
                                  category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product1"
                             productName:@"Stella sunglasses"
                                   price:@"$58"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product2"
                             productName:@"Whitney belt"
                                   price:@"$35"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product3"
                             productName:@"Garden strand"
                                   price:@"$98"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product4"
                             productName:@"Strut earrings"
                                   price:@"$34"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product5"
                             productName:@"Varsity socks"
                                   price:@"$12"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product6"
                             productName:@"Weave keyring"
                                   price:@"$16"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product7"
                             productName:@"Gatsby hat"
                                   price:@"$40"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product8"
                             productName:@"Shrug bag"
                                   price:@"$198"
                                category:@"Accessories"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product9"
                             productName:@"Glit desk trio"
                                   price:@"$58"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product10"
                             productName:@"Copper wire rack"
                                   price:@"$18"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product11"
                             productName:@"Smooth ceramic set"
                                   price:@"$28"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product12"
                             productName:@"Hurrahs tea set"
                                   price:@"$34"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product13"
                             productName:@"Blue stone mug"
                                   price:@"$18"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product14"
                             productName:@"Rainwater tray"
                                   price:@"$27"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product15"
                             productName:@"Chambray napkins"
                                   price:@"$16"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product16"
                             productName:@"Succulent planters"
                                   price:@"$16"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product17"
                             productName:@"Quartet table"
                                   price:@"$175"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product18"
                             productName:@"Kitchen quattro"
                                   price:@"$129"
                                category:@"Home"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product19"
                             productName:@"Adobe Sweater"
                                   price:@"$48"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product20"
                             productName:@"Sea tunic"
                                   price:@"$45"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product21"
                             productName:@"Plaster tunic"
                                   price:@"$38"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product22"
                             productName:@"White pinstripe shirt"
                                   price:@"$70"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product23"
                             productName:@"Chambray shirt"
                                   price:@"$70"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product24"
                             productName:@"Seabreeze sweater"
                                   price:@"$60"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product25"
                             productName:@"Gentry jacket"
                                   price:@"$178"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product26"
                             productName:@"Navy trousers"
                                   price:@"$74"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product27"
                             productName:@"Walter henley (white)"
                                   price:@"$38"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product28"
                             productName:@"Surf and perf shirt"
                                   price:@"$48"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product29"
                             productName:@"Bixby scarf"
                                   price:@"$98"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product30"
                             productName:@"Ramona crossover"
                                   price:@"$68"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product31"
                             productName:@"Chambray shirt"
                                   price:@"$38"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product32"
                             productName:@"Classic white collar"
                                   price:@"$58"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product33"
                             productName:@"Cerise scallop tee"
                                   price:@"$42"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product34"
                             productName:@"Shoulder rolls tee"
                                   price:@"$27"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product35"
                             productName:@"Grey slouch tank"
                                   price:@"$24"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product36"
                             productName:@"Sunshirt dress"
                                   price:@"$58"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }
    {
      Product *product =
      [[Product alloc] initWithImageName:@"Product37"
                             productName:@"Fine lines tee"
                                   price:@"$58"
                                category:@"Clothing"];
      [_allProducts addObject:product];
    }

    _categoryFilter = @"";
    _filteredProducts = _allProducts;
  }
  return self;
}

- (Product *)productAtIndex:(NSUInteger)index {
  if (index >= _filteredProducts.count) {
    NSAssert(0, @"Invalid Product Index");
    return nil;
  }

  return _filteredProducts[index];
}

- (NSUInteger)count {
  return _filteredProducts.count;
}

- (void)setCategoryFilter:(NSString *)categoryFilter {
  if (!categoryFilter) {
    categoryFilter = @"";
  }
  if ([self.categoryFilter isEqualToString:categoryFilter])
    return;

  _categoryFilter = categoryFilter;
  [self applyFilter];

  [[NSNotificationCenter defaultCenter] postNotificationName:CatalogFilterDidChangeNotification
                                                      object:nil];
}

- (void)applyFilter {
  if ([self.categoryFilter isEqualToString:@""]) {
    _filteredProducts = _allProducts;
    return;
  }

  NSIndexSet *matchingSet = [_allProducts indexesOfObjectsPassingTest:^BOOL(Product * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    if ([obj.category isEqualToString:self.categoryFilter])
      return YES;
    else
      return NO;
  }];
  _filteredProducts = [_allProducts objectsAtIndexes:matchingSet];
}

@end
