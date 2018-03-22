//
//  DetailViewController.swift
//  flickr
//
//  Created by Daniel Kong on 3/20/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.yellow
        view.addSubview(imageView)
        setupConstriants()
    }
    
    private func setupConstriants() {
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //        imageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        if #available(iOS 11, *) {
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        } else {
            imageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        }
        //        blueview.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 88)
    }
    
    
}
