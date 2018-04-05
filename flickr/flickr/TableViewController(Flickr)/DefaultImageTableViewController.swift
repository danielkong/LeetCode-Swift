//
//  DefaultImageTableViewController.swift
//  flickr
//
//  Created by Daniel Kong on 4/3/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit
// let apistring = https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=d740c18ec39b9e37ee1ad5c7d8fa76d1&text=lake&safe_search=1&extras=url_m&per_page=10&format=json&nojsoncallback=1&api_sig=3031b2149b7b2d52a7872754e1313c31

class DefaultImageTableViewController: UITableViewController {

    let apistring = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9efb9172233e8ec5f3d8d22d0f4b6247&text=uber&safe_search=1&extras=url_m&per_page=20&format=json&nojsoncallback=1"
    
    private let kCellId = "cellId"
    
    // data
    var rowsModel = [PhotoModel]()
    
    // UI property
    let loadingIndicatorView: UIActivityIndicatorView = {
        let loadingIndicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
        loadingIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicatorView.startAnimating()
        return loadingIndicatorView
    }()
    
    override func viewDidLoad() {
        
        // setup view
        tableView.register(CustomImageTableViewCell.self, forCellReuseIdentifier: kCellId)
        tableView.rowHeight = 100
        // This cause the rowHeight not 100
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .cyan
        
        view.addSubview(loadingIndicatorView)
        setupConstraints()
        
        // API call
        APIService.shared.fetchData(urlString: apistring, completion: { (data, errorString) in

            if errorString != nil {
                print(errorString!)
            }
            let str_data = String.init(data: data!, encoding: .utf8)
            print(str_data)
            do {
                let json = try JSONDecoder().decode(RootFlickrModel.self, from: data!)
                self.rowsModel = json.photos.photo
            
                DispatchQueue.main.async {
                    self.loadingIndicatorView.stopAnimating()
                    self.tableView.reloadData()
                }
                
            } catch let jsonErr {
                print("Error decoding Json Questons", jsonErr)
            }
            
        })
    }
    
    func setupConstraints() {
        loadingIndicatorView.center = view.center
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! CustomImageTableViewCell
        cell.model = rowsModel[indexPath.row]
//        cell.textLabel?.text = rowsModel[indexPath.row].title ?? "z~~~~~~~"
//        if cell.textLabel?.text?.count == 0 {
//            cell.textLabel?.text = "why is empty"
//        }
        if indexPath.row == 2 {
            cell.mainTitle.text = "I am very long, long \n long, long, \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n  text."
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailvc = DefaultImageDetailViewController(photoModel: rowsModel[indexPath.row])
//        present(detailvc, animated: true, completion: nil)
        navigationController?.pushViewController(detailvc, animated: true)
    }
    
    
}
