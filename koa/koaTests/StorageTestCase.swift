//
//  StorageTestCase.swift
//  koa
//
//  Created by Daniel Kong on 5/14/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import XCTest
@testable import koa

class StorageTestCase: XCTestCase {
    /// Storage save model to File, and check it could retrive data from disk.
    func testStorageSaveModelToFile() {
        // Save Model to File
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "MovieModel", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                guard let movieModel = try? JSONDecoder().decode(Movie.self, from: data) else {
                    XCTAssert(false, "MovieModel creation failed")
                    return
                }
                Storage.store(movieModel, to: .documents, as: "test.json")
            }
        }
        let result = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("test.json", isDirectory: false)
        XCTAssertTrue(FileManager.default.fileExists(atPath: result.path), "Should exists")
        
        // Retrive Data From File
        if let movie = Storage.retrieve("test.json", from: .documents, as: Movie.self) {
            XCTAssertNotNil(movie, "Retrive Movie Data get nil.")
        }
    }
    
    /// Check Storage remove file Function 
    func testStorageRemoveFile() {
        Storage.remove("test.json", from: .documents)
        let removedURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("test.json", isDirectory: false)
        
        XCTAssertFalse(FileManager.default.fileExists(atPath: removedURL.path), "File not get removed.")
    }
}
