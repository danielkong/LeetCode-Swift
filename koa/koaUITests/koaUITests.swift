//
//  koaUITests.swift
//  koaUITests
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import XCTest

class koaUITests: XCTestCase {
    
    let existsPredicate = NSPredicate(format: "exists == true")

    var app: XCUIApplication!
    var searchBar: XCUIElement { return app.searchFields.firstMatch }
    var firstTabBar: XCUIElement { return app.buttons.matching(identifier: "Movies Tab Bar item").firstMatch }
    var secondTabBar: XCUIElement { return app.buttons.matching(identifier: "Favorites Tab Bar item").firstMatch }
    var emptyLabel: XCUIElement { return app.staticTexts.matching(identifier: "Empty Label").firstMatch }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testInitialLaunchWithEmptyState() {
        /// initial launch our app, check search movie page with empty state
        XCTAssertEqual(emptyLabel.label, "Movie List is empty now,  please search the movies you like,  and add it into your favorites.")
    }

    func testRegularSearchAndFavoriteList() {
        /// regular search movie with several results
        searchBar.tap()
        searchBar.typeText("James")
        waitForInterval(1)
        let searchButton = app.buttons.matching(identifier: "Search").firstMatch
        searchButton.tap()
        
        let firstCell = app.cells.firstMatch
        waitForExists(firstCell)
        XCTAssertNotNil(app.staticTexts["Skyfall"])
        
        /// Check Detail View Controller all titles and buttons
        app.staticTexts["Skyfall"].tap()
        let movieName = app.staticTexts.matching(identifier: "Movie Name").firstMatch
        waitForExists(movieName)
        
        XCTAssertEqual(movieName.label, "Skyfall", "Detail page movie title does not right")
        XCTAssertEqual(app.staticTexts.matching(identifier: "Genre | Release Year").firstMatch.label, "Action & Adventure | 2012", "Detail page genre and release year title does not right")
        XCTAssertEqual(app.staticTexts.matching(identifier: "Content Rating | Duration Time").firstMatch.label, "PG-13 | 143 mins", "Detail page content rating and duration time title does not right")
        XCTAssertNotNil(app.buttons.matching(identifier: "Trailer Button").firstMatch, "Trailer button does not appear")
        
        /// Check fav button works
        let favButton = app.buttons.matching(identifier: "Fav Button").firstMatch
        XCTAssertNotNil(favButton, "Favortie button does not appear")
        favButton.tap()
        waitForInterval(1)
        
        /// Check Favorite Page have that one just marked favorite.
        secondTabBar.tap()
        
        let firstCellInFavorList = app.cells.firstMatch
        waitForExists(firstCellInFavorList)
        XCTAssertNotNil(app.staticTexts["Skyfall"])
        
        /// Check un-favorite movie
        /// Go back to detail page in movies search list, click favorite button again,
        firstTabBar.tap()
        waitForExists(favButton)
        favButton.tap()
        waitForInterval(1)
        
        /// Check favorite list page does not have that movie.
        /// Check Favorite List page with Empty State
        secondTabBar.tap()
        waitForExists(emptyLabel)
        
        XCTAssertEqual(emptyLabel.label, "Favorite Movie List is empty now,  please go to movie list page,  and add some to your favorites.", "Favorites list page is not empty state")
    }
    
    /// search but no result test, check alert view pop up
    func testNoResultSearch() {
        searchBar.tap()
        searchBar.typeText("Jammmmmmmmmmmm")
        waitForInterval(1)
        let searchButton = app.buttons.matching(identifier: "Search").firstMatch
        searchButton.tap()
        
        // expect alert show up
        let alertViewTitle = app.staticTexts["Opps"]
        waitForExists(alertViewTitle)
        XCTAssertNotNil(app.buttons["Okay"])
    }
    
    
    // Helper
    func waitForExists(_ element: XCUIElement) {
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 5)
    }
    
    func waitForInterval(_ interval: TimeInterval) {
        Thread.sleep(forTimeInterval: interval)
    }
    
}
