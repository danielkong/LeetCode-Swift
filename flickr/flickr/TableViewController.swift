//
//  ViewController.swift
//  flickr
//
//  Created by Daniel Kong on 3/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

/**
    Autolayout + UITableView
  1. Did not set `translatesAutoresizingMaskIntoConstraints` then nothing show up
  2. When imageView is UIView, tableView does not show up, UIView does not have height
  3. `topLayoutGuide` fix NavigationBar hidden imageView.
 
 */

import UIKit

class TableViewController: UIViewController {
    
    private let cellId = "tableviewCellId"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = UIColor.yellow
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        tableview.delegate = self
        tableview.dataSource = self
        
//        tableview.rowHeight = UITableViewAutomaticDimension
//        tableview.estimatedRowHeight = 44.0
//        tableview.rowHeight =
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(tableview)
        
        setupConstraints()
        
    }

    private func setupConstraints() {
        let margin = view! // view.layoutMarginsGuide
        imageView.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
//        imageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        if #available(iOS 11, *) {
            imageView.topAnchor.constraint(equalTo: margin.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        } else {
            imageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        }
//        blueview.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20).isActive = true
        imageView.bottomAnchor.constraint(equalTo: tableview.topAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 88)

        tableview.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        tableview.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20).isActive = true

    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailViewController()
        navigationController?.pushViewController(dvc, animated: true)
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        cell.textLabel?.text = "test"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
}

//import Foundation
//import UIKit
//
//class LayoutUtils {
//    static func disableAutoresizingMaskConstraints(for views : [UIView]){
//        views.forEach { view in
//            view.translatesAutoresizingMaskIntoConstraints = false
//        }
//    }
//}

