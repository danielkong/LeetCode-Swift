//
//  APIManagerTestCase.swift
//  koaTests
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import XCTest
@testable import koa

/**
 initial state
 after searching reload state
 */
class APIManagerTestCase: XCTestCase {
    var apiManagerUnderTest: APIServiceManager?

    override func setUp() {
        super.setUp()
        apiManagerUnderTest = APIServiceManager()

        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "RootModel", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        let url = URL(string: "https://itunes.apple.com/search?entity=movie&term=jack")
        let urlResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
        apiManagerUnderTest?.defaultSession = sessionMock
        
        
    }
    
    override func tearDown() {
        apiManagerUnderTest = nil
        super.tearDown()
    }
    
    func testFetchDataUpdateSearchResults() {
        let promise = expectation(description: "Status code: 200")
        
        XCTAssertEqual(apiManagerUnderTest?.movies.count, 0, "searchResults should be empty before the data task runs")
        apiManagerUnderTest?.fetchData(searchTerm: "jack", completionHandler: {_,_ in
            promise.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)        
        XCTAssertEqual(apiManagerUnderTest?.movies.count, 3, "Didn't parse 3 items from fake response")
    }    
}
