//
//  ViewController.swift
//  May18
//
//  Created by Daniel Kong on 5/18/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, MovieListViewModelProtocol {
    private let kCellId = "tableViewCellId"
//    private let kFileName = "Jack_Johnson"
    
    // MVC
    var movies = [Movie]()
    
    // MVVM
    var viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        tableView.backgroundColor = .white
        
        viewModel.presenter = self
        viewModel.fetchData()
        
        // MVC
//        fetchData()
    }
    
    // MovieListViewModelProtocol
    func reloadListData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // TableViewDataSource & Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count // movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath)
//        var fullName = ""
        let movie = viewModel.movies[indexPath.row] // MVVM
//        let movie = movies[indexPath.row] // MVC
//        if let firstName = movie.artistName {
//            fullName += firstName
//        }
//        if let lastName = movie.trackName {
//            fullName += lastName
//        }
        cell.textLabel?.text = movie.fullName
        cell.imageView?.loadImageFrom(urlString: movie.artworkUrl100!) {

            cell.setNeedsLayout()
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}



