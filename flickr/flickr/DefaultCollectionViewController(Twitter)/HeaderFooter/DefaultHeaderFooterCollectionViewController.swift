//
//  DefaultCollectionViewControllerWithHeaderFooter.swift
//  flickr
//
//  Created by Daniel Kong on 4/1/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class DefaultHeaderFooterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let kCellId = "cellId"
    private let kTweetCellId = "tweetcellId"

    private let kHeaderId = "headerId"
    private let kFooterId = "footerId"

    // Data Model
    // Data Model From Networking
    var userModels = [User]()
    var tweetsModels = [Tweet]()
    
    // Data Model From Local
//    let users: [User] = {
//        let aUser = User(id: 1000, name: "Test Name", username: "@testName", bioText: "I am bio texting ...", imageString: "profile_image")
//        let danielUser = User(id: 1001, name: "Daniel Kong", username: "@daniel kong", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", imageString: "profile_image")
//        let rayUser = User(id: 1002, name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", imageString: "ray_profile_image")
//
//        return [aUser,aUser,aUser,aUser,aUser, danielUser, rayUser]
//    }()
    
//    let tweets: [Tweet] = {
//        let aUser = User(id: 1000, name: "Test Name", username: "@testName", bioText: "I am bio texting ...", imageString: "profile_image")
//        let danielUser = User(id: 1001, name: "Daniel Kong", username: "@daniel kong", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", imageString: "profile_image")
//        let rayUser = User(id: 1002, name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", imageString: "profile_image")
//        let first = Tweet(user: aUser, message: "Welcome Tweet, Welcome Tweet,Welcome Tweet,Welcome Tweet,Welcome Tweet,Welcome Tweet,Welcome Tweet,Welcome Tweet,Welcome Tweet,")
//        let second = Tweet(user: danielUser, message: "good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!good luck!")
//        return [first, second]
//    }()
    
    let errorMessageLabel: UILabel = {
        let errorMessageLabel = UILabel()
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = "Something went wrong, try again later... "
        errorMessageLabel.isHidden = true
        return errorMessageLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()

        view.addSubview(self.errorMessageLabel)
        
        setupConstraints()
        
        collectionView?.backgroundColor = UIColor(red: 232.0/255.0, green: 236.0/255.0, blue: 241.0/255.0, alpha: 1)
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: kCellId)
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: kTweetCellId)

        collectionView?.register(CollectionViewHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderId)
        collectionView?.register(CollectionViewFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: kFooterId)
        
//        fetchData()
        Service.shared.fetchHomeData { (users, tweets, errorString) in
            if errorString != nil {
                DispatchQueue.main.async {
                    self.errorMessageLabel.isHidden = false
                    self.errorMessageLabel.text = errorString
                }

                return
            }
            print("completion")
            if users != nil, tweets != nil {
                self.userModels = users!
                self.tweetsModels = tweets!
            }

            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    func setupConstraints() {
        errorMessageLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        errorMessageLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        errorMessageLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        errorMessageLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
//    let urlString = "https://api.letsbuildthatapp.com/twitter/home"
//    func fetchData() {
//        if let url = URL.init(string: urlString) {
//            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    print("error")
//                }
//
//                if let data = data, let response = response as? HTTPURLResponse {
//                    if response.statusCode >= 200 && response.statusCode <= 299 {
//                        print("successful call")
//                        // JSON serialization
//                        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
////                        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
////                        handler(json as AnyObject?, nil)
//
//                        guard let userData = json["users"] as? [[String: AnyObject]] else {
//                            print("do right format user data")
//                            return
//                        }
//                        guard let tweets = json["tweets"] as? [[String: AnyObject]] else {
//                            print("do right format tweets data")
//                            return
//                        }
//                        print(userData)
//                        var users = [User]()
//                        for userDict in userData {
//                            let userModel = User(id: userDict["id"] as! Int, name:  userDict["name"] as! String, username: userDict["username"] as! String, bioText: userDict["bio"] as! String, imageString: userDict["profileImageUrl"] as! String)
//                            users.append(userModel)
//                        }
//                        self.userModels = users
//
//                        DispatchQueue.main.async {
//                            self.collectionView?.reloadData()
//                        }
//                        print(tweets)
//
//
//
//                    }
//                }
//                print(4321)
//            }
//            dataTask.resume()
//            print(1234)
//
//        }
//
//    }
    
    // Rotation -- uptake cell and UIStackView
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    // CollectionView Delegate and DataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 { return tweetsModels.count }
//        if section == 1 { return tweets.count }
        return userModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:kTweetCellId, for: indexPath) as! TweetCell
//            (cell as! TweetCell).tweet = tweets[indexPath.row]
            (cell as! TweetCell).tweet = tweetsModels[indexPath.row]
            return cell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:kCellId, for: indexPath) as! UserCell
            (cell as! UserCell).model = userModels[indexPath.row]
            return cell
        }

    }
    
    // Collection View Delegate Flowlayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // dynamic height
        if indexPath.section == 0 {
            if let user: User = userModels[indexPath.row] {
                //        if let user: User = users[indexPath.row] {
                let approximateWidth  = view.frame.width - 12 - 50 - 12
                let size = CGSize(width: approximateWidth, height:1000)
                let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
                
                let estimatedFrame = NSString(string:user.bio).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                return CGSize(width: view.frame.width, height: estimatedFrame.height + 66 + 15)
                
            }
        }

        return CGSize(width: view.frame.width, height: 150)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderId, for: indexPath)
//            header.backgroundColor = .blue
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kFooterId, for: indexPath) as! CollectionViewFooterCell
            footer.textLabel.text = "Show Me More"
            footer.textLabel.textColor = .blue
//            footer.backgroundColor = .darkGray
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        if section == 0, userModels.count == 0 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        if section == 0, userModels.count == 0 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 200
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Navigation Bar Items
    
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupLeftNavItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.addTarget(self, action: #selector(relatedActionTap), for: .touchUpInside)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    // Action
    @objc func relatedActionTap() {
        print("Search")
    }
}
