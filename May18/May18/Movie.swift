//
//  Movie.swift
//  May18
//
//  Created by Daniel Kong on 5/18/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let trackName: String?
    let artistName: String?
    let artworkUrl100: String?
    
    var fullName: String? {
        return trackName! + " " + artistName!
    }
}
