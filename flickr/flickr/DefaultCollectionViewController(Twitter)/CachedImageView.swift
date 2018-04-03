//
//  CachedImageView.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {
    static let imageChache = NSCache<NSString, DiscardableImageCacheItem>()
    var shouldUseDefaultImage = true
    
    public init(defaultImage: UIImage? = nil, cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


open class DiscardableImageCacheItem: NSObject, NSDiscardableContent {
    
    private(set) public var image: UIImage?
    var accessCount: UInt = 0
    
    public init(image: UIImage) {
        self.image = image
    }
    
    public func beginContentAccess() -> Bool {
        if image == nil {
            return false
        }
        
        accessCount += 1
        return true
    }
    
    public func endContentAccess() {
        if accessCount > 0 {
            accessCount -= 1
        }
    }
    
    public func discardContentIfPossible() {
        if accessCount == 0 {
            image = nil
        }
    }
    
    public func isContentDiscarded() -> Bool {
        return image == nil
    }
    
}
