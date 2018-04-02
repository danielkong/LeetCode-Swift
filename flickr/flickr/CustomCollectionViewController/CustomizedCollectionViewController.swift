//
//  collectionViewController.swift
//  flickr
//
//  Created by Daniel Kong on 3/15/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

class CustomizedCollectionViewController: UIViewController {
    
    private let kCollectionViewCellId = "collectionViewCellId"
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize.init(width: 80, height: 80)
        
//        layout.collectionViewContentSize = CGSize.init(width: 80, height: 80)
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: self.collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomizedCollectionViewCell.self, forCellWithReuseIdentifier: self.kCollectionViewCellId)
        collectionView.backgroundColor = UIColor.yellow
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }
}

extension CustomizedCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("test collection view: ")
    }
}

extension CustomizedCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellId, for: indexPath) as! CustomizedCollectionViewCell
        cell.backgroundColor = UIColor.purple
        cell.title.text = "abcd"
        return cell
    }
}

extension CustomizedCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
