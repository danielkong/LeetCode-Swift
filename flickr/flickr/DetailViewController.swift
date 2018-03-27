//
//  DetailViewController.swift
//  flickr
//
//  Created by Daniel Kong on 3/20/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewDelegate: NSObjectProtocol {
    func highlightSelectedImage()
}

class DetailViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(doneTap), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: DetailViewDelegate?
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.yellow
        view.addSubview(imageView)
        view.addSubview(doneButton)
        
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
        
//        doneButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        doneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        if #available(iOS 11, *) {
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        } else {
            doneButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -50).isActive = true
        }
    }
    
    @objc func doneTap() {
        print("done")
        self.delegate?.highlightSelectedImage()
    }
    
    
}
