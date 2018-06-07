//
//  ImageView+Loading.swift
//  Demo
//
//  Created by Daniel Kong on 5/19/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

var cache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadingImage(urlString: String, completion: @escaping () -> ()) {
        guard let url = URL(string: urlString) else {
            print("invalid url string")
            return
        }
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("")
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 {
                if let data = data {
                    if cache.object(forKey: urlString as NSString) == nil {
                        cache.setObject(UIImage(data: data)!, forKey: urlString as NSString)
                    }
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                        completion()
                    }
                }
            }
        }.resume()
    }
}
