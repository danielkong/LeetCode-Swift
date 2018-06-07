//
//  CustomImageView.swift
//  Apr5
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageWithURLString(_ string: String) {
        
        imageUrlString = string
        
        let str = string as NSString
        if let storedImage = imageCache.object(forKey: str) as? UIImage {
            self.image = storedImage
        } else {
            APIService.shared.fetchData(string, completion: { data, errString in
                if errString != nil {
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        let tempImage = UIImage.init(data: data)!
                        imageCache.setObject(tempImage, forKey: str)
                        if self.imageUrlString == string {
                            self.image = tempImage
                        }
                    }
                }
            })
        }
    }
}
