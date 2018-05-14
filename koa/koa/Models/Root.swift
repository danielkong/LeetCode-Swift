//
//  Root.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

public struct Root: Codable {
    let resultCount: Int
    let results: [Movie]
}
