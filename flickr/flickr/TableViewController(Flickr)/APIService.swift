//
//  APIService.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

class APIService: NSObject {
    
    private let apiString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9efb9172233e8ec5f3d8d22d0f4b6247&text=uber&safe_search=1&extras=url_m&per_page=5&format=json&nojsoncallback=1"

    static let shared = APIService()
    
    func fetchData(urlString: String, completion: @escaping (Data?, String?) -> ()) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                
                if error != nil {
                        completion(nil, error.debugDescription)
                }
                
                if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode >= 200 && response.statusCode < 299 {
                        print(response.statusCode)
                        completion(data, nil)
                    } else {
                        completion(nil, "something got wrong, try again")
                    }
                }
            }).resume()
        }
    }

    
}
