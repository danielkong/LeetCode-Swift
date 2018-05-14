//
//  MovieModel.swift
//  koaTests
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import XCTest
@testable import koa
/**
 Model Test
 */
class MovieModelTestCase: XCTestCase {
    func testModelCreation() {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "MovieModel", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                guard let movieModel = try? JSONDecoder().decode(Movie.self, from: data) else {
                    XCTAssert(false, "MovieModel creation failed")
                    return
                }
                XCTAssertEqual(movieModel.artistId, 909253, "movie model artistId is wrong.")
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
