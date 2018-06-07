//
//  ViewController.swift
//  May22
//
//  Created by Daniel Kong on 5/22/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

/**
 10.05
 10.10 1-100 rows
 10.26 show name
 10.45 show cached image
 10.55 use MVVM
 */

/**
 2.28 start
 2.32 1-100
 2.40 fetch data (8min JSONSerilization, 5min JSONDecoder)
 2.43 show full name
 2.58 show image
    2.49 image extension
    2.50 image cell refresh
    2.58 caching
 3.10 update to MVVM
 */
import UIKit

class ViewController: UITableViewController, PersonListProtocol {
    private let kCellId = "tableViewCellId"
    
    var personList = PersonListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        
        personList.presenter = self
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        personList.fetchData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath)
        cell.textLabel?.text = personList.persons[indexPath.row].fullName ?? ""
        if let imageString = personList.persons[indexPath.row].url {
            cell.imageView?.loadingImage(urlString: imageString) {
                cell.setNeedsLayout()
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func updatedData() {
        self.tableView.reloadData()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

