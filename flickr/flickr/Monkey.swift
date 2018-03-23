//
//  Monkey.swift
//  flickr
//
//  Created by Daniel Kong on 3/22/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

/**
 { "id": "40242713784",
 "owner": "10881108@N06",
 "secret": "2ac9f47c1e",
 "server": "813",
 "farm": 1,
 "title": "CAMILLE ALAPHILIPPE TOURS",
 "ispublic": 1,
 "isfriend": 0,
 "isfamily": 0,
 "url_m": "https:\/\/farm1.staticflickr.com\/813\/40242713784_2ac9f47c1e.jpg",
 "height_m": "500",
 "width_m": "282"
 },
 */
import Foundation

struct Monkey {
    let id: String
    let owner: String
    let secret: String
    let url_m: String
    let height_m: String
    let width_m: String
    let title: String
    
    init(dictionary: [String: AnyObject]) {
        id = dictionary[BaseClientAPI.JSONResponseKeys.id] as! String // as? String ?? ""
        owner = dictionary[BaseClientAPI.JSONResponseKeys.owner] as! String
        secret = dictionary[BaseClientAPI.JSONResponseKeys.secret] as! String
        url_m = dictionary[BaseClientAPI.JSONResponseKeys.url_m] as! String
        height_m = dictionary[BaseClientAPI.JSONResponseKeys.height_m] as! String
        width_m = dictionary[BaseClientAPI.JSONResponseKeys.width_m] as! String
        title = dictionary[BaseClientAPI.JSONResponseKeys.title] as! String

    }
    
    static func monkeysFromResults(_ results: [[String: AnyObject]]) -> [Monkey] {
        var monkeys = [Monkey]()
        
        //iterate array
        for result in results {
            monkeys.append(Monkey(dictionary: result))
        }
        return monkeys
    }
}

extension Monkey: Equatable {}

func ==(lhs: Monkey, rhs: Monkey) -> Bool {
    return lhs.id == rhs.id
}
