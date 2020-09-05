//
//  Product.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Int
    let location: String
    let image: String
}
