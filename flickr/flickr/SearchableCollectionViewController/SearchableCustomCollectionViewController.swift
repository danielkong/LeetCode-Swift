//
//  SearchableCollectionViewController.swift
//  flickr
//
//  Created by Daniel Kong on 4/4/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class SearchableCustomCollectionViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    // model
    var photos = [PhotoModel]()
    private let kCellId = "cellId"
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellId)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
//        if #available(iOS 11, *) {
//            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        } else {
//            searchBar.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
//        }
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 22).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44+22).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // delegate
    var searchContent = ""
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchContent = searchText
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        // call api service
        // https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9efb9172233e8ec5f3d8d22d0f4b6247&text=uber&safe_search=1&extras=url_m&per_page=20&format=json&nojsoncallback=1
        if searchContent.count == 0 { return }
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9efb9172233e8ec5f3d8d22d0f4b6247&text=\(searchContent)&safe_search=1&extras=url_m&per_page=20&format=json&nojsoncallback=1"
        APIService.shared.fetchData(urlString: urlString, completion: {(data, errorString) in
            if errorString != nil {
                print(errorString!)
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(RootFlickrModel.self, from: data)
                    self.photos = json.photos.photo
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                } catch let err {
                    print(err)
                }
            }
        })
    }
    
    // collection view delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}
