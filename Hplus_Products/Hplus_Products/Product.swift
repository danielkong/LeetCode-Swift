//
//  Product.swift
//  Hplus_Products
//
//  Created by Daniel Kong on 4/28/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
struct Product: Decodable {
    let id: String
    let image: String
    let image_title: String
    let name: String
    let description: String
}
