//
//  Product.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import Foundation

struct Products: Decodable {
    let status: String
    let pageType: Int
    let plpResults: PlpResults
}

struct PlpResults: Decodable {
    let records: [Record]
}

struct Record: Decodable {
    let productId: Int
    let productDisplayName: String
    let listPrice: Int
    let seller: String
    let smImage, lgImage, xlImage: String
}
