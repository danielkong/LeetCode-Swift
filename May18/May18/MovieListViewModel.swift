//
//  MovieListViewModel.swift
//  May18
//
//  Created by Daniel Kong on 5/19/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
protocol MovieListViewModelProtocol {
    func reloadListData()
}

class MovieListViewModel: NSObject {
    var presenter: MovieListViewModelProtocol?
    var movies = [Movie]()
    private let kFileName = "Jack_Johnson"

    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            if let url = Bundle.main.url(forResource: self.kFileName, withExtension: "json") {
                if let data = try? Data(contentsOf: url) {
                    // JSON Serilization
                    if let jsonDict = try? JSONSerialization.jsonObject(with: data, options: []) {
                        self.movies.removeAll()
                        if let dict = jsonDict as? NSDictionary {
                            if let movieArrayJSON = dict["results"] as? NSArray {
                                for i in 0..<movieArrayJSON.count {
                                    if let dict = movieArrayJSON[i] as? NSDictionary {
                                        self.movies.append(Movie.init(trackName: dict["trackName"] as? String, artistName: dict["artistName"] as? String, artworkUrl100: dict["artworkUrl100"] as? String))
                                    }
                                }
                                
                            }
                        }
                        // JSONDecoder
                        //                    if let json = try? JSONDecoder().decode(Root.self, from: test) {
                        //                        self.movies = json.results ?? []
                        self.presenter?.reloadListData()
                    }
                }
            }
        }
    }
    
}
