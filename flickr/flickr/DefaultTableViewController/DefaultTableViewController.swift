//
//  DefaultTableViewController.swift
//  flickr
//
//  Created by Daniel Kong on 4/1/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class DefaultTableViewController: UITableViewController {
    private let kCellId = "tableviewcellId"
    // Data Model
    let users: [User] = {
        let aUser = User(id: 1000, name: "Test Name", username: "@testName", bioText: "I am bio texting ...", imageString: "profile_image")
        
        let brianUser = User(id: 1001, name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", imageString: "profile_image")
        
        let rayUser = User(id: 1002, name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference. Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", imageString: "profile_image")
        
        return [aUser,aUser,aUser,aUser, brianUser, rayUser]
    }()

    override func viewDidLoad() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: kCellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! CustomTableViewCell
        cell.messageLabel.text = users[indexPath.row].bioText
//        cell.imageView?.image = UIImage(named:"profile_image")
        return cell
    }
    
}
