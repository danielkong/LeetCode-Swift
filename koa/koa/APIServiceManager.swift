//
//  APIServiceManager.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//
/**
    1. If there is two search request in short time, cancel the first request
 */
import Foundation
import UIKit

typealias MovieResult = ([Movie]?, String) -> ()
typealias ImageResult = (UIImage?, String) -> ()

public class APIServiceManager {
    static let shared = APIServiceManager()
    
    struct Constant {
        static let APIScheme = "https"
        static let APIHost = "itunes.apple.com"
        static let APIPath = "/search"
        static let queryEntityName = "entity"
        static let queryEntityValue = "movie"
        static let queryTermName = "term"
    }
    // defaultSession conforms to DHURLSession protocol for Tests
    var defaultSession: DHURLSession = URLSession(configuration: .default)
    var task: URLSessionDataTask?
    var errorMessage = ""

    var movies = [Movie]()

    func fetchData(searchTerm: String, completionHandler: @escaping MovieResult) {
        task?.cancel()
        var urlComponents = URLComponents()
        urlComponents.scheme = Constant.APIScheme
        urlComponents.host = Constant.APIHost
        urlComponents.path = Constant.APIPath
        let queryItemEntity = URLQueryItem(name: Constant.queryEntityName, value: Constant.queryEntityValue)
        let queryItemTerm = URLQueryItem(name: Constant.queryTermName, value: searchTerm)
        urlComponents.queryItems = [queryItemEntity, queryItemTerm]
        guard let url = urlComponents.url else { return }
        
        task = defaultSession.dataTask(with: url) { data, response, error in
            defer { self.task = nil }
            self.movies.removeAll()

            if let error = error {
                self.errorMessage = error.localizedDescription + "\n"
                DispatchQueue.main.async {
                    completionHandler(nil, self.errorMessage)
                }
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                self.updateSearchResults(data)
                DispatchQueue.main.async {
                    completionHandler(self.movies, "")
                }
            }
        }
        task?.resume()
    }
    
    func fetchImage(url: URL, completionHandler: @escaping ImageResult) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.errorMessage = error.localizedDescription + "\n"
                DispatchQueue.main.async {
                    completionHandler(nil, self.errorMessage)
                }
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                DispatchQueue.main.async {
                    completionHandler(UIImage(data: data), "")
                }
            }
        }
        task.resume()
    }
    
    // Helper Method
    private func updateSearchResults(_ data: Data) {
        do {
            let json = try JSONDecoder().decode(Root.self, from: data)
            movies = json.results
        } catch let parseErr as NSError {
            errorMessage += "Response data does not correct JSON format, error: \(parseErr.localizedDescription)"
            return
        }
    }
}
