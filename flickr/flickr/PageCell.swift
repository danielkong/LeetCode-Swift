//
//  PageCell.swift
//  flickr
//
//  Created by Daniel Kong on 3/15/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            //            print(page?.imageName)
            
            guard let unwrappedPage = page else { return }
            
            imageView.image = UIImage(named: unwrappedPage.imageName)
//
//            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
//
//            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
//
//            descriptionTextView.attributedText = attributedText
//            descriptionTextView.textAlignment = .center
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(imageView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 26).isActive = true
        //        blueview.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
