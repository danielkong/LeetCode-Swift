//
//  User.swift
//  flickr
//
//  Created by Daniel Kong on 4/1/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let bio: String
    let profileImageUrl: String
}

class another: NSObject {
    var id: Int = 0
    init(_ test: Int) {
        id = test
        super.init()
    }
    
}
