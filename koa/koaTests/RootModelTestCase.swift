//
//  RootModelTestCase.swift
//  koaTests
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import XCTest
/**
 Model Test
 */
class RootModelTestCase: XCTestCase {
    func testModelCreation() {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "RootModel", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                guard let rootModel = try? JSONDecoder().decode(Root.self, from: data) else {
                    XCTAssert(false, "RootModel creation failed")
                    return
                }
                XCTAssertEqual(rootModel.resultCount, 3, "root model result count is wrong.")
                XCTAssertNotNil(rootModel.results, "root model results is nil")
            }
        } else {
            XCTAssert(false, "Could not find file to create RootModel")
        }
    }
    
    override func setUp() {
        super.setUp()
        testModelCreation()
    }
}
