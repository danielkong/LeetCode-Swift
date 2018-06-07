//
//  ViewController.swift
//  Demo
//
//  Created by Daniel Kong on 5/17/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

/**
 10.41
 10.44 1-100
 10.58 first name
 11.02 finish full name
 11.20 Show Image
 11.28 Cache
 
 11.45-11.53 ViewModel
 
 */
import UIKit

class ViewController: UITableViewController, MovieListProtocol {
    private let kCellId = "cellId"
    private let kFileName = "Jack_Johnson"
    var models = [Movie]()
    
    var movieListViewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        view.backgroundColor = .white
        
        movieListViewModel.presenter = self
        movieListViewModel.fetchDataFromBundle()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.models.count // models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath)
        let movie = movieListViewModel.models[indexPath.row] // models[indexPath.row]

        // 1 extension, 2 create custom cell,
        if let imgString = movie.artworkUrl100 {
            cell.imageView?.loadingImage(urlString: imgString) {
                cell.textLabel?.text = movie.fullName
                cell.textLabel?.lineBreakMode = .byTruncatingMiddle
                cell.layoutIfNeeded()
                cell.setNeedsLayout()
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func updateData() {
        
    }
}

