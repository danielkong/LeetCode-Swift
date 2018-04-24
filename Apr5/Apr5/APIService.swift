//
//  APIService.swift
//  Apr5
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

class APIService: NSObject {
    static let shared = APIService()
    
    func fetchData(_ urlString: String, completion: @escaping (Data?, String?)->() ) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if error != nil {
                    completion(nil, error.debugDescription)
                }
                if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode >= 200 && response.statusCode <= 299 {
                        print(response.statusCode)
                        completion(data, nil)
                    } else {
                        print("wrong")
                    }
                }
            }).resume()
        } else {
            print("wrong url string")
        }
    }
}
