//
//  PhotoModel.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
/**
 {
     "id": "40510130724",
     "owner": "24551000@N08",
     "secret": "795516b424",
     "server": "815",
     "farm": 1,
     "title": "eine ungew\u00f6hnliche Wolkenformation",
     "ispublic": 1,
     "isfriend": 0,
     "isfamily": 0,
     "url_m": "https:\/\/farm1.staticflickr.com\/815\/40510130724_795516b424.jpg",
     "height_m": "375",
     "width_m": "500"
 }
 */
struct PhotoModel: Decodable {
    let id: String?
    let owner: String?
    let secret: String?
    let server: String?
    let farm: Int?
    let title: String?
    let ispublic: Int?
    let isfamily: Int?
    let url_m: String?
    let height_m: String?
    let width_m: String?
}
