//
//  CustomImageView.swift
//  koa
//
//  Created by Daniel Kong on 5/12/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
        
    func loadImageUsingUrlString(_ urlString: String) {
        imageUrlString = urlString
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage as? UIImage
            return
        }
        
        APIService.shared.fetchData(urlString: urlString) { data, errorString in
            if errorString != nil {
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        if self.imageUrlString == urlString {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}
