//
//  ThumbnailTableViewController.swift
//  Hplus_Products
//
//  Created by Daniel Kong on 5/5/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//


// 1.43
import UIKit

class ThumbnailTableViewController: UITableViewController {
//    override init(style: UITableViewStyle) {
//        super.init(style: style)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private let kCellId = "tableViewCellId"
    private var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        
        // load from file
        let filePath = Bundle.main.path(forResource: "products", ofType: "json")
        if let data = NSData(contentsOfFile: filePath!) as Data? {
            do {
                // try JSONDecoder().decode([Product].self, from: data)
                let json = try JSONDecoder().decode(Page.self, from: data)
                products = json.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonErr {
                print("Error decoding Json Questions", jsonErr)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard products.count > 0 else { return 10 }
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath)
        guard products.count > 0 else {
            cell.textLabel?.text = String(indexPath.row)
            return cell
        }
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }
    
    // 2.16
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController.init(product: products[indexPath.row])
        present(detailVC, animated: true, completion: nil)
    }
}
