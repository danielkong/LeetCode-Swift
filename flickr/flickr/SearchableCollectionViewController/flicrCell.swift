//
//  flicrCell.swift
//  flickr
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class FlickrCell: UICollectionViewCell {
    // model
    var model: PhotoModel? {
        didSet {
            if let urlString = model?.url_m {
                imageView.loadImageUsingUrlString(urlString)
            }
        }
    }
    
    let imageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
