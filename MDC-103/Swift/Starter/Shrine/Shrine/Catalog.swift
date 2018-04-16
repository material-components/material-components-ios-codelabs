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
  private static let products = [
    Product(imageName: "ProductBackpack", productName: "Backpack", price: "$11.22"),
    Product(imageName: "ProductBeachball", productName: "Beachball", price: "$11.22"),
    Product(imageName: "ProductBinoculars", productName: "Binoculars", price: "$11.22"),
    Product(imageName: "ProductBrush", productName: "Brush", price: "$11.22"),
    Product(imageName: "ProductChair", productName: "Chair", price: "$11.22"),
    Product(imageName: "ProductChucks", productName: "Chucks", price: "$11.22"),
    Product(imageName: "ProductClock", productName: "Clock", price: "$11.22"),
    Product(imageName: "ProductFishbowl", productName: "Fishbowl", price: "$11.22"),
    Product(imageName: "ProductFlippers", productName: "Flippers", price: "$11.22"),
    Product(imageName: "ProductHeels", productName: "Heels", price: "$11.22"),
    Product(imageName: "ProductHelmet", productName: "Helmet", price: "$11.22"),
    Product(imageName: "ProductLamp", productName: "Lamp", price: "$11.22"),
    Product(imageName: "ProductLawnchair", productName: "Lawnchair", price: "$11.22"),
    Product(imageName: "ProductLipstick", productName: "Lipstick", price: "$11.22"),
    Product(imageName: "ProductPopsicle", productName: "Popsicle", price: "$11.22"),
    Product(imageName: "ProductRadio", productName: "Radio", price: "$11.22"),
    Product(imageName: "ProductShoes", productName: "Shoes", price: "$11.22"),
    Product(imageName: "ProductSunnies", productName: "Sunnies", price: "$11.22"),
    Product(imageName: "ProductSurfboard", productName: "Surfboard", price: "$11.22"),
    Product(imageName: "ProductTeapot", productName: "Teaport", price: "$11.22"),
    Product(imageName: "ProductTools", productName: "Tools", price: "$11.22"),
    Product(imageName: "ProductTypewriter", productName: "Typewriter", price: "$11.22"),
    Product(imageName: "ProductUmbrella", productName: "Umbrella", price: "$11.22"),
  ]

  static var count: Int {
    return Catalog.products.count
  }

  public static func productAtIndex(index: Int) -> Product {
    return Catalog.products[index]
  }
}
