//
//  Photo.swift
//  Apr5
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
/**
 id: "40360204255",
 owner: "152152006@N08",
 secret: "738c9a14ac",
 server: "787",
 farm: 1,
 title: ""With Tesla in a Danger Zone, Can Model 3 Carry It to Safety?" by JAMES B. STEWART via NYT Business Day https://buff.ly/2q8Zp27",
 ispublic: 1,
 isfriend: 0,
 isfamily: 0,
 url_m: "https://farm1.staticflickr.com/787/40360204255_738c9a14ac.jpg",
 height_m: "262",
 width_m: "500"
 */
struct Photo: Decodable {
    let id: String?
    let url_m: String?
    let title: String?
}

