//
//  CachableImageView.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

public class CachableImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(_ urlString: String) {
        imageUrlString = urlString
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage as? UIImage
            return
        }
        if let url = URL(string: urlString) {
            APIServiceManager.shared.fetchImage(url: url) { image, errorMessage in
                if !errorMessage.isEmpty {
                    return
                }
                if let image = image {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    if self.imageUrlString == urlString {
                        self.image = image
                    }
                }
            }
        }
    }

}
