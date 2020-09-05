//
//  Product.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let productId: Int
    let productDisplayName: String
    let listPrice: Int
    let seller: String
    let smImage: String
    let lgImage: String
    let xlImage: String
}
