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

  required init(imageName: String, productName: String, price: String) {
    self.imageName = imageName
    self.productName = productName
    self.price = price
    super.init()
  }
}

class Catalog: NSObject {
  private static var products = [Product]()

  override init() {
    super.init()

    let product1 = Product(imageName: "ProductBackpack", productName: "Backpack", price: "$11.22")
    Catalog.products.append(product1)

    let product2 = Product(imageName: "ProductBeachball", productName: "Beachball", price: "$11.22")
    Catalog.products.append(product2)

    let product3 = Product(imageName: "ProductBinoculars", productName: "Binoculars", price: "$11.22")
    Catalog.products.append(product3)

    let product4 = Product(imageName: "ProductBrush", productName: "Brush", price: "$11.22")
    Catalog.products.append(product4)

    let product5 = Product(imageName: "ProductChair", productName: "Chair", price: "$11.22")
    Catalog.products.append(product5)

    let product6 = Product(imageName: "ProductChucks", productName: "Chucks", price: "$11.22")
    Catalog.products.append(product6)

    let product7 = Product(imageName: "ProductClock", productName: "Clock", price: "$11.22")
    Catalog.products.append(product7)

    let product8 = Product(imageName: "ProductFishbowl", productName: "Fishbowl", price: "$11.22")
    Catalog.products.append(product8)

    let product9 = Product(imageName: "ProductFlippers", productName: "Flippers", price: "$11.22")
    Catalog.products.append(product9)

    let product10 = Product(imageName: "ProductHeels", productName: "Heels", price: "$11.22")
    Catalog.products.append(product10)

    let product11 = Product(imageName: "ProductHelmet", productName: "Helmet", price: "$11.22")
    Catalog.products.append(product11)

    let product12 = Product(imageName: "ProductLamp", productName: "Lamp", price: "$11.22")
    Catalog.products.append(product12)

    let product13 = Product(imageName: "ProductLawnchair", productName: "Lawnchair", price: "$11.22")
    Catalog.products.append(product13)

    let product14 = Product(imageName: "ProductLipstick", productName: "Lipstick", price: "$11.22")
    Catalog.products.append(product14)

    let product15 = Product(imageName: "ProductPen", productName: "Pen", price: "$11.22")
    Catalog.products.append(product15)

    //TODO: Finish Catalog
  }

//  private static var singleton = Catalog()
//
//  class func productCatalog() -> Catalog {
//    return singleton
//  }

  public static let count: Int = {
    return Catalog.products.count
  }()

  public static func productAtIndex(index: Int) -> Product {
    return Catalog.products[index]
  }
}
