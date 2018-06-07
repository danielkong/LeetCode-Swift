//
//  UIImageView+Loading.swift
//  May22
//
//  Created by Daniel Kong on 5/23/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

let cache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadingImage(urlString: String, completion: @escaping ()->()) {
        if let url = URL(string: urlString) {
            let keyString = urlString as NSString
            if let cachedImage = cache.object(forKey: keyString) {
                self.image = cachedImage
            } else {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    if let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 {
                        if let data = data {
                            if let newImage = UIImage(data: data) {
                                if cache.object(forKey: keyString) != nil {
                                    
                                } else {
                                    cache.setObject(newImage, forKey: keyString)
                                    // write into FileManager
//                                    FileManager.default.
                                }
                                
                                
                                DispatchQueue.main.async {
                                    self.image = newImage
                                    completion()
                                }
                            }
                        }
                    }
                    }.resume()
            }
            
        }
    }
}
