//
//  MovieListViewModel.swift
//  Demo
//
//  Created by Daniel Kong on 5/19/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

protocol MovieListProtocol {
    func updateData()
}

class MovieListViewModel {
    var presenter: MovieListProtocol?
    var models = [Movie]()
    private let kFileName = "Jack_Johnson"

    func fetchDataFromBundle() {
        models.removeAll()
        DispatchQueue.global().async {
            if let url = Bundle.main.url(forResource: self.kFileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    // JSONSerilization
                    let jsonDict = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonDict = jsonDict as? NSDictionary {
                        if let array = jsonDict["results"] as? NSArray {
                            for item in array {
                                if let dict = item as? NSDictionary {
                                    let movie = Movie.init(trackName: dict["trackName"] as? String, artistName: dict["artistName"] as? String, artworkUrl100: dict["artworkUrl100"] as? String)
                                    self.models.append(movie)
                                }
                            }
                        }
                    }
                    // 2. JSONDecoder
                    //                    let json = try? JSONDecoder().decode(Root.self, from: data)
                    //                    self.models = json?.results ?? []
                    self.presenter?.updateData()
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
                    
                } catch let err {
                    print("no data from url \(err.localizedDescription)")
                }
            }
        }
    }
}
