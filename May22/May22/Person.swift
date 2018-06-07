//
//  Person.swift
//  May22
//
//  Created by Daniel Kong on 5/23/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let role: String?
    let url: String?
    
    var fullName: String? {
        var array = [String]()
        if let first = firstName {
            array.append(first)
        }
        if let last = lastName {
            array.append(last)
        }
        return array.joined(separator: " ")
    }
}
