//
//  Tweet.swift
//  flickr
//
//  Created by Daniel Kong on 4/2/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct Tweet: Decodable {
    let user: User
    let message: String
    let image: Image
    // could create init with JSON dictionary
    /**
     use TRON
     use SwifyJSON
     init(json: JSON) {
        self.message = json["message"].stringValue
        ...
     }
     
     if not,
     init(json: [String: AnyObject]) { ... }
     
     */
}


struct Image: Decodable {
    let width: Int
    let height: Int
    let imageUrl: String
}
