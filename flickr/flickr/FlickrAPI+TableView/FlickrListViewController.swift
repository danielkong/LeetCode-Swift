//
//  FlickrListViewController.swift
//  flickr
//
//  Created by Daniel Kong on 3/22/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

class FlickrListViewController: UIViewController {
    
    // MARK: Property
    var monkeys: [Monkey] = [Monkey]()

    // MARK: Outlets
    
    let cellId = "tableViewCellId"
    lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(MonkeyCell.self, forCellReuseIdentifier: cellId)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = UITableViewAutomaticDimension
        return tableview
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        view.addSubview(tableview)
        setupConstraints()
    }
    
    let apipath = "https://api.flickr.com/services/rest/"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // get data
        let urlRequest = BaseClientAPI.shared().generateUrlRequest(path: apipath, params: ["extras": "url_m", "text": "monkey", "safe_search": "1", "method": "flickr.photos.search", "api_key": "277f27da8244dc7868a790f302171a65", "format": "json", "nojsoncallback":"1", "per_page": "10"]) // "page" : "3"
        BaseClientAPI.shared().sendURLRequest(urlRequest) { (result: AnyObject?, _ error: String?) -> Void in
            if let result = result?["photos"] as? [String:AnyObject] {
                if let photos = result["photo"] as? [[String:AnyObject]] {
                    self.monkeys = Monkey.monkeysFromResults(photos)
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                }
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(FlickrListViewController.contentSizeCategoryChanged(notification:)), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
    }
    
    // This function will be called when the Dynamic Type user setting changes (from the system Settings app)
    @objc func contentSizeCategoryChanged(notification: NSNotification)
    {
        tableview.reloadData()
    }
    
    
    func setupConstraints() {
        if #available(iOS 11, *) {
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            tableview.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            tableview.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        }

        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension FlickrListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monkeys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MonkeyCell
        cell.title.text = "testing"
        cell.subtitle.text = "testing subtitle subtitletesting"
        if monkeys.count > 0 {
            cell.monkey = monkeys[indexPath.row]
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailViewController()
        dvc.delegate = self
        DispatchQueue.global().async {
            self.loadImageWithURL(self.monkeys[indexPath.row].url_m) { image in
                DispatchQueue.main.async {
                    dvc.imageView.image = image!
                }
            }
        }

        navigationController?.pushViewController(dvc, animated: true)
    }
    
    private func loadImageWithURL(_ urlString :String, completionHandler: @escaping (_ image: UIImage?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            if let data = data {
                if let image = UIImage.init(data: data) {
                    completionHandler(image)
                }
            }
        }
        task.resume()
    }
}

extension FlickrListViewController: DetailViewDelegate {
    func highlightSelectedImage() {
        print("highlight")
    }
}
