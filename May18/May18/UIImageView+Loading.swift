//
//  UIImageView+Loading.swift
//  May18
//
//  Created by Daniel Kong on 5/18/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

var cache = NSCache<NSString, NSData>()

extension UIImageView {
    func loadImageFrom(urlString: String, completionHandler: @escaping ()->()) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error.debugDescription)
                }
                if let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 299 {
                    if let data = data {
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data)
                            completionHandler()
                        }
                    }
                }
            }.resume()
        }
    }
}
