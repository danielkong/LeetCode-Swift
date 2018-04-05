//
//  DefaultImageDetailViewController.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class DefaultImageDetailViewController: UIViewController {
    
    // UI
    let dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderColor = followColor.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.addTarget(self, action: #selector(followTap), for: .touchUpInside)
        button.setTitleColor(followColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setImage(UIImage(named: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit

        return button
    }()
    
    let imageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 3.0
        scrollView.contentSize = self.imageView.frame.size
        scrollView.delegate = self
        return scrollView
    }()
    
    // Model
    var model: PhotoModel?
    
    convenience init(photoModel: PhotoModel) {
        self.init()
        self.model = photoModel
    }
    
    override func viewDidLoad() {
        if let urlString = model?.url_m {
            imageView.loadImageUsingUrlString(urlString)
        }
        
        
        
        view.backgroundColor = .lightGray
        view.addSubview(dismissButton)
        view.addSubview(imageView)
        view.addSubview(scrollView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: 5).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: 5).isActive = true

        dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func followTap() {
        dismiss(animated: true, completion: nil)
    }
}


extension DefaultImageDetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
