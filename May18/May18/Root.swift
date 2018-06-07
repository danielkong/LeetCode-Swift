//
//  Root.swift
//  May18
//
//  Created by Daniel Kong on 5/18/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct Root: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}
