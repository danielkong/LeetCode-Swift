//
//  DetailViewController.swift
//  Hplus_Products
//
//  Created by Daniel Kong on 5/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

/**
 2.20
    add image view
    add close button
    add close func
 
 2.30
    toilet
 2.45
    call image
 2.53
    cache
 3.08
    file manager save into file system
5.45
    add Activity indicator
    make urlSessionTask cancelable, if dismiss this page
    cancel all tasks in one session
    handle multiple same call
*/
var cache = NSCache<NSString, NSData>()

class DetailViewController: UIViewController {
    private let product: Product
    private let fileManager = FileManager.default
    
    var task: URLSessionTask? = nil
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close Me", for: .normal)
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        return loadingIndicator
    }()
    
    override func viewDidLoad() {
        view.addSubview(imageView)
        view.addSubview(closeButton)
        view.addSubview(loadingIndicator)
        view.backgroundColor = .white
        loadingIndicator.startAnimating()
        
        fetchImageData()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        task?.cancel()
    }
    
    func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        closeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
//        loadingIndicator.center = imageView.center
        loadingIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
    }
    
    @objc func closeTapped() {
        print("closing me ")
        dismiss(animated: true, completion: nil)
    }
    
    func fetchImageData() {
        let urlstring = product.image
        // very large image configuration
        
        // if cache has then load from cache or FS, otherwise request
        let imageTitle_nsstring = product.image_title as NSString
        if let cacheImageData = cache.object(forKey: imageTitle_nsstring) {
            self.imageView.image = UIImage(data: cacheImageData as Data)
        } else if let imageOnDisk = UIImage(contentsOfFile: pathForImage(product.image_title)) {
            // check image on disk or not
            self.imageView.image = imageOnDisk
        } else {
            
            loadingIndicator.startAnimating()

            let conf = URLSessionConfiguration.default
            // size bytes
            conf.urlCache?.memoryCapacity = 1024 * 1024
            conf.urlCache?.diskCapacity = 1024 * 1024

            let imageURLSession = URLSession(configuration: conf)
            task = imageURLSession.dataTask(with: URL(string: urlstring)!) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        print("error")
                    }
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        if let data = data {
                            // save into cache and FS
                            if cache.object(forKey: imageTitle_nsstring) == nil {
                                cache.setObject(data as NSData, forKey: imageTitle_nsstring)
                                // image size larger than 1024 bytes save into file system
                                if data.count > 1024  {
                                    if !self.fileManager.fileExists(atPath: self.pathForImage(self.product.image_title)) {
                                        DispatchQueue.global(qos: .background).async {
                                            let _ = self.fileManager.createFile(atPath: self.pathForImage(self.product.image_title), contents: data, attributes: nil)
                                        }
                                    }
                                }
                            }
                            self.loadingIndicator.stopAnimating()
                            self.imageView.image = UIImage(data: data)
                        }
                    }
                }
            }
            task!.resume()
        }
    }
    
    let persistenceId = "AppNameCachedImages"
    lazy var cacheFilePath: String = {
        guard let cachesDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else {
            fatalError("ImageFileCache Error: The users caches directory could not be found")
        }
        
        return cachesDirectory.appending("/\(persistenceId)")
    }()
    
    private func pathForImage(_ imageName: String) -> String {
        let cacheDirectory = cacheFilePath
//        do {
            _ = try? fileManager.createDirectory(atPath: cacheDirectory, withIntermediateDirectories: false, attributes: nil)
//        } catch let err {
//            print("")
//            print("failed to create directory, \(err.localizedDescription)")
//        }

        return cacheFilePath.appending("/\(imageName)")
    }
}
