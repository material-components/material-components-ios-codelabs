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

import UIKit

class Product: NSObject {
  public private(set) var imageName: String
  public private(set) var productName: String
  public private(set) var price: String
  public private(set) var category: String
  public private(set) var isFeatured: Bool

  required init(imageName: String, productName: String, price: String, category: String, isFeatured: Bool) {
    self.imageName = imageName
    self.productName = productName
    self.price = price
    self.category = category
    self.isFeatured = isFeatured
    super.init()
  }
}

class Catalog: NSObject {
  // Notification that gets posted when categoryFilter is changed
  public static let CatalogFilterDidChangeNotification: Notification.Name =
      Notification.Name(rawValue: "CatalogFilterDidChangeNotification")

  private static let products = [
    Product(imageName: "Product0", productName: "Vagabond sack", price: "$120", category: "Accessories", isFeatured:true),
    Product(imageName: "Product0", productName: "Stella sunglasses", price: "$58", category: "Accessories", isFeatured:true),
    Product(imageName: "Product0", productName: "Whitney belt", price: "$35", category: "Accessories", isFeatured:false),
    Product(imageName: "Product0", productName: "Garden strand", price: "$98", category: "Accessories", isFeatured:true),
    Product(imageName: "Product0", productName: "Strut earnings", price: "$34", category: "Accessories", isFeatured:false),
    Product(imageName: "Product0", productName: "Varsity socks", price: "$12", category: "Accessories", isFeatured:false),
    Product(imageName: "Product0", productName: "Weave keyring", price: "$16", category: "Accessories", isFeatured:false),
    Product(imageName: "Product0", productName: "Gatsby hat", price: "$40", category: "Accessories", isFeatured:true),
    Product(imageName: "Product0", productName: "Shrug bag", price: "$198", category: "Accessories", isFeatured:true),
    Product(imageName: "Product0", productName: "Gilt desk trio", price: "$58", category: "Home", isFeatured:true),
    Product(imageName: "Product0", productName: "Copper wire rack", price: "$18", category: "Home", isFeatured:false),
    Product(imageName: "Product0", productName: "Soothe ceramic set", price: "$28", category: "Home", isFeatured:false),
    Product(imageName: "Product0", productName: "Hurrahs tea set", price: "$34", category: "Home", isFeatured:false),
    Product(imageName: "Product0", productName: "Blue stone mug", price: "$18", category: "Home", isFeatured:true),
    Product(imageName: "Product0", productName: "Rainwater tray", price: "$27", category: "Home", isFeatured:true),
    Product(imageName: "Product0", productName: "Chambray napkins", price: "$16", category: "Home", isFeatured:true),
    Product(imageName: "Product0", productName: "Succulent planters", price: "$16", category: "Home", isFeatured:true),
    Product(imageName: "Product0", productName: "Quartet table", price: "$175", category: "Home", isFeatured:true),
    Product(imageName: "Product0", productName: "Kitchen quattro", price: "$129", category: "Home", isFeatured:false),
    Product(imageName: "Product0", productName: "Adobe sweater", price: "$48", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Sea tunic", price: "$45", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Plaster tunic", price: "$38", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "White pinstripe shirt", price: "$70", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Chambray shirt", price: "$70", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Seabreeze sweater", price: "$60", category: "Clothing", isFeatured:true),
    Product(imageName: "Product0", productName: "Gentry jacket", price: "$178", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Navy trousers", price: "$74", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Walter henley (white)", price: "$38", category: "Clothing", isFeatured:true),
    Product(imageName: "Product0", productName: "Surf and perf shirt", price: "$48", category: "Clothing", isFeatured:true),
    Product(imageName: "Product0", productName: "Bixby scarf", price: "$98", category: "Clothing", isFeatured:true),
    Product(imageName: "Product0", productName: "Ramona crossover", price: "$68", category: "Clothing", isFeatured:true),
    Product(imageName: "Product0", productName: "Chambray shirt", price: "$38", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Classic white collar", price: "$58", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Cerise scallop tee", price: "$42", category: "Clothing", isFeatured:true),
    Product(imageName: "Product0", productName: "Shoulder rolls tee", price: "$27", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Grey slouch tank", price: "$24", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Sunshirt dress", price: "$58", category: "Clothing", isFeatured:false),
    Product(imageName: "Product0", productName: "Fine lines tee", price: "$58", category: "Clothing", isFeatured:true),
  ]

  private static var filteredProducts: [Product] = products

  static var count: Int {
    return Catalog.filteredProducts.count
  }

  public static func productAtIndex(index: Int) -> Product {
    return Catalog.filteredProducts[index]
  }

  static var categoryFilter: String = "" {
    didSet(newFilter) {
      self.applyFilter()
      NotificationCenter.default.post(name: CatalogFilterDidChangeNotification, object: nil)
    }
  }

  class func applyFilter() {
    self.filteredProducts.removeAll()
    for product in self.products {
      if (self.categoryFilter == "" || self.categoryFilter == "Featured") && product.isFeatured {
        self.filteredProducts.append(product)
      } else if product.category == self.categoryFilter {
        self.filteredProducts.append(product)
      }
    }
  }
}
