//
//  Database.swift
//  UIScrollView Homework
//
//  Created by Gulnaz on 22.11.2022.
//

import Foundation
import UIKit

//MARK: Product struct
struct Product {
    var name: String
    var description: String?
    var mainImage: UIImage
    var additionalImage1: UIImage?
    var additionalImage2: UIImage?
    var inStock: Bool
    var price: Double
    static var identifierFactory = 0
    var identifier: Int
    
    init (name: String, mainImage: UIImage, inStock: Bool, price: Double) {
        self.name = name
        self.mainImage = mainImage
        self.inStock = inStock
        self.price = price
        self.identifier = Product.identifierFactory
        Product.identifierFactory += 1
    }
    init () {
        self.name = "empty"
        self.mainImage = UIImage(systemName: "timelapse")!
        self.inStock = false
        self.price = 999.00
        self.identifier = Product.identifierFactory
        Product.identifierFactory += 1
    }
    
}
// MARK: PRODUCTS IN THE SHOP

var currentProduct: Product? = nil
let names = ["Airpods Max", "Apple Pencil", "iPhone Leder Wallet", "Apple Watch Series 7", "iPhone 13 Pro"]
let prices = [1090.0, 140.0, 1050.0, 1400.0, 695.0]
var products: [Product] = []
func addProductsToArray () {
    for x in 0..<names.count {
        if let mainImage = UIImage(named: names[x]) {
            products.append(Product(name: names[x], mainImage: mainImage, inStock: true, price: prices[x]))
        }
        products[x].description = """
        Very nice products by Apple. Very nice products by Apple.
                Very nice products by Apple.
                Very nice products by Apple.
                Very nice products by Apple. Very nice products by Apple.
                Very nice products by Apple.
                Very nice products by Apple.
                Very nice products by Apple. Very nice products by Apple.
        """
    }
    products[0].additionalImage1 = UIImage(named: "Airpods Max_1")
    products[0].additionalImage2 = UIImage(named: "Airpods Max_2")
    
}

