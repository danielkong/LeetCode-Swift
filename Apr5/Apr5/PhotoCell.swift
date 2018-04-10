//
//  PhotoCell.swift
//  Apr5
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    var model: Photo? {
        didSet {
            if let urlstring = model?.url_m {
                imageView.loadImageWithURLString(urlstring)
//                APIService.shared.fetchData(urlstring, completion: { data, errString in
//                    if errString != nil {
//                        print(errString)
//                        return
//                    }
//                    if let data = data {
//                        DispatchQueue.main.async {
//                            self?.imageView.image = UIImage.init(data: data)
//                        }
//                    }
//                })
            }
        }
    }
    
    let imageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

    }
    
    
    
    
    
    
    
}
