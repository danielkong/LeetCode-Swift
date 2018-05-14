//
//  ViewController.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//
/**
    1. search bar and table view
    2. adaptive iPhone X(iOS 11)
    3. update status bar network activity indicator. While loading, status bar networking activity is loading
    4.
 Extra:
    1. Empty State View for movie list/favorites list page, when tableview count is 0,
 */
/**
 Enum: TableViewType -- Decide show search view controller / favorites list view controller
 */
import UIKit

enum TableViewType: Int {
    case search
    case list
}

class MovieTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    // properties
    private var type: TableViewType = .search
    private var searchTerm = ""
    private var needsSearch: Bool {
        return type == .search
    }
    struct Constant {
        static let kSalesforceColor = UIColor(red: 0.0/255.0, green: 165.0/255.0, blue: 229.0/255.0, alpha: 1)
        static let kTableViewCellId = "tableViewCellId"
        static let kCellHeight: CGFloat = 140
        
        static let kSearchBarPlaceHolder = "Enter your search term for a movie."
        static let kSearchNavTitle = "Movies"
        static let kListNavTitle = "Favorites"
        static let kSearchEmptyLabelTitle = "Movie List is empty now,\n please search the movies you like,\n and add it into your favorites."
        static let kListEmptyLabelTitle = "Favorite Movie List is empty now,\n please go to movie list page,\n and add some to your favorites."
        
        static let kAlertErrorTitle = "Error"
        static let kAlertNoResultTitle = "Opps"
        static let kAlertOkay = "Okay"
        
        static let kFavoriteImageView = UIImageView(image: UIImage(named: "fav_red"))
        
        static let kStorageFileName = "favorites.json"
    }
    
    // Model
    var movies: [Movie] = []
    
    // UI View
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = Constant.kSearchBarPlaceHolder
        searchBar.delegate = self
        searchBar.accessibilityIdentifier = "Search Bar"
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: Constant.kTableViewCellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = . white
        return tableView
    }()
    
    lazy var emptyStateView: UIView = {
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.backgroundColor = Constant.kSalesforceColor
        emptyView.addSubview(self.emptyLabel)
        return emptyView
    }()
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.accessibilityIdentifier = "Empty Label"
        return label
    }()
    
    convenience init(type: TableViewType) {
        self.init()
        self.type = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = needsSearch ? Constant.kSearchNavTitle : Constant.kListNavTitle

        if needsSearch {
            view.addSubview(searchBar)
        }
        view.addSubview(tableView)
        view.addSubview(emptyStateView)
        emptyLabel.text = needsSearch ?  Constant.kSearchEmptyLabelTitle : Constant.kListEmptyLabelTitle
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let favs = Storage.retrieve(Constant.kStorageFileName, from: .documents, as: [Movie].self), !needsSearch {
            movies = favs
            favSet = Set(favs)
            emptyStateView.isHidden = movies.count != 0
        }
        tableView.reloadData()
    }
    
    private func fetchMovieData(_ term: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        APIServiceManager.shared.fetchData(searchTerm: term) { movies, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if !errorMessage.isEmpty {
                let alert = UIAlertController(title: Constant.kAlertErrorTitle, message: errorMessage, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: Constant.kAlertOkay, style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
            if let movies = movies {
                if movies.count == 0 && self.needsSearch {
                    let alert = UIAlertController(title: Constant.kAlertNoResultTitle, message: "There is no result for your search term \"\(term)\". Please retry your search term.", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: Constant.kAlertOkay, style: .default, handler: nil)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
                self.emptyStateView.isHidden = movies.count != 0
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupConstraints() {
        // Adaptive iPhone X
        if needsSearch {
            if #available(iOS 11, *) {
                searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                searchBar.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
            }
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            searchBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        } else {
            if #available(iOS 11, *) {
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
            }
        }
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        emptyStateView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        emptyStateView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        emptyStateView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
        emptyStateView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor).isActive = true
        
        emptyLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: emptyStateView.centerYAnchor).isActive = true
    }

    // TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = MovieDetailViewController(movie: movies[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.kTableViewCellId, for: indexPath) as! MovieTableViewCell
        cell.model = movies[indexPath.row]
        cell.accessoryView = favSet.contains(movies[indexPath.row]) ? Constant.kFavoriteImageView : nil
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.kCellHeight
    }
    
    // SearchBar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // if the text is empty we are done
        if searchText == "" {
            movies.removeAll()
            emptyStateView.isHidden = false
            tableView.reloadData()
            return
        }
        searchTerm = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        fetchMovieData(searchTerm)
    }
}
