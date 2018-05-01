//
//  ViewController.swift
//  Hplus_Products
//
//  Created by Daniel Kong on 4/28/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

enum HTTPError: Error {
    case invalidResponse
    case invalidStatusCode
    case requestFailed
}

enum HTTPStatusCode: Int {
    case success = 200
}

class ViewController: UITableViewController {
    var products: [Product] = []
    private let kCellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(TableViewSubtitleCell.self, forCellReuseIdentifier: kCellId)
        tableView.backgroundColor = .white
        fetchData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func fetchData() {
        let urlString = "https://hplussport.com/api/products"
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            print("fetch data")
            if error != nil {
                print("error")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print(HTTPError.invalidResponse)
                return
            }
            
            if response.statusCode == 200 {
                // success
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode([Product].self, from: data)
                        self.products = json
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch let jsonErr {
                        print("Error decoding Json Questions", jsonErr)
                    }
                }
            } else {
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath)

        cell.textLabel?.text = products[indexPath.row].image_title
        cell.detailTextLabel?.text = products[indexPath.row].description
        cell.imageView?.loadImage(products[indexPath.row].image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    //
//    struct PageResult<T> {
//
//    }

}

