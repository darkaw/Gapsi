//
//  Product.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import Foundation

struct Product: Codable {
    let status: Status
    let pageType: String
    let plpResults: PlpResults
}

struct Status: Codable {
    let status: String
    let statusCode: Int
}

struct PlpResults: Codable {
    let records: [Record]
}

struct Record: Codable {
    let productId: String
    let productDisplayName: String
    let listPrice: Int
    let seller: String
    let smImage, lgImage, xlImage: String
}
