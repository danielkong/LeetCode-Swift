//
//  ViewController.swift
//  Apr5
//
//  Created by Daniel Kong on 4/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

// https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9efb9172233e8ec5f3d8d22d0f4b6247&text=uber&safe_search=1&extras=url_m&per_page=20&format=json&nojsoncallback=1

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var models: [Photo] = []
    private let kCellId = "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .blue
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: kCellId)
        
        let str = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=69c4f86b20ceb7438e1496e03ee17ae3&text=tesla&safe_search=1&extras=url_m&per_page=18&format=json&nojsoncallback=1"
        
        APIService.shared.fetchData(str, completion: { [weak self] data, errorString in
            // alertView
            if errorString != nil {
                print(errorString)
            }

            if let data = data {
                do {
                    let json = try JSONDecoder().decode(Page.self, from: data)
                    self?.models = json.photos.photo
                    
                    DispatchQueue.main.async {
                        self?.collectionView?.reloadData()
                    }
                } catch let err {
                    print("wrong", err)
                }
            }

        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! PhotoCell
        cell.contentView.backgroundColor = .yellow
        cell.layer.cornerRadius = 10
        cell.model = models[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width/2 - 10.0 * 2
        return CGSize.init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

