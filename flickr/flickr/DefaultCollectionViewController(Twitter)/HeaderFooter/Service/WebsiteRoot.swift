//
//  WebsiteRoot.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct WebsiteRoot: Decodable {
    let users: [User]
    let tweets: [Tweet]
}
