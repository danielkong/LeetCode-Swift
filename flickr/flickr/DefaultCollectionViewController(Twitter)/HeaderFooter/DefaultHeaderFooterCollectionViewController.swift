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
    private let kHeaderId = "headerId"
    private let kFooterId = "footerId"

    // Data Model
    let users: [User] = {
        let aUser = User(id: 1000, name: "Test Name", username: "@testName", bioText: "I am bio texting ...")
        
        let brianUser = User(id: 1001, name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!")
        
        let rayUser = User(id: 1002, name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.")
        
        return [aUser,aUser,aUser,aUser,aUser, brianUser, rayUser]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()

        collectionView?.backgroundColor = UIColor(red: 232.0/255.0, green: 236.0/255.0, blue: 241.0/255.0, alpha: 1)
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: kCellId)
        collectionView?.register(CollectionViewHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderId)
        collectionView?.register(CollectionViewFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: kFooterId)

//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(relatedActionTap))
//            // navigationItem.navigationItem.rightBarButtonItem = UIBarButtonItem.init(
//            title: "Title",
//            style: .done,
//            target: self,
//            action: "rightButtonAction:"
//        )
//        collectionView?.reloadData()
    }
    
    // CollectionView Delegate and DataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:kCellId
            , for: indexPath) as! UserCell
        cell.model = users[indexPath.row]
        return cell
    }
    
    // Collection View Delegate Flowlayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // dynamic height
        
        if let user: User = users[indexPath.row] {
            let approximateWidth  = view.frame.width - 12 - 50 - 12
            let size = CGSize(width: approximateWidth, height:1000)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string:user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66 + 15)

        }
        return CGSize(width: view.frame.width, height: 150)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderId, for: indexPath)
//            header.backgroundColor = .blue
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kFooterId, for: indexPath) as! CollectionViewHeaderCell
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
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
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
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysTemplate), for: .normal)
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
