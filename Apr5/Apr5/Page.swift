//
//  PageModel.swift
//  Apr5
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct Page: Decodable {
    let photos: PhotoList
    let stat: String
}
