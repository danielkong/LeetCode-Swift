//
//  PhotoListModel.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct PhotoListModel: Decodable  {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo:[PhotoModel]
}
