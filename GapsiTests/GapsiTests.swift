//
//  GapsiTests.swift
//  GapsiTests
//
//  Created by Darkaw on 10/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import XCTest
@testable import Gapsi
class GapsiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testProduct(){
        let record = Record(productId: "asdas", productDisplayName: "Bicicleta", listPrice: 23, seller: "Liverpool", smImage: "asdasd", lgImage: "asdasd", xlImage: "asdsad")
        
        XCTAssertEqual(0,1)
    }

}
