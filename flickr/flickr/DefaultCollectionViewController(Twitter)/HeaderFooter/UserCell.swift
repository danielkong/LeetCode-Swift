//
//  WordCell.swift
//  flickr
//
//  Created by Daniel Kong on 4/1/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit


// create init since get called when a cell is dequeued

let followColor = UIColor(red: 61.0/255.0, green: 167.0/255.0, blue: 244.0/255.0, alpha: 1)


class UserCell: UICollectionViewCell {
    
    // model
    var model: User? {
        didSet {
            if let user = model {
                nameLabel.text = user.name
                userIdLabel.text = user.username
                bioTextView.text = user.bioText
            }
        }
    }
    // UI Properties
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
//        nameLabel.backgroundColor = .green
        nameLabel.text = "Daniel Kong"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 5
//        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .red
        
        return imageView
    }()
    
    let userIdLabel: UILabel = {
        let userIdLabel = UILabel()
//        userIdLabel.backgroundColor = .purple
        userIdLabel.text = "@danielkong"
        userIdLabel.font = UIFont.systemFont(ofSize: 14)
        userIdLabel.textColor = .darkGray
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        return userIdLabel
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.text = "Bio testing, Bio testing, Bio testing, Bio testing, Bio testing, Bio testing, Bio testing, Bio testing, Bio testing ..."
        
        textView.font = UIFont.systemFont(ofSize: 15)
        
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .cyan
        button.layer.cornerRadius = 10
        button.layer.borderColor = followColor.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(followColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setImage(UIImage(named: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
        
    }()
    
    // create init since get called when a cell is dequeued
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.clipsToBounds = true // if image out of bounds, then could use this cut off image

//        layer.borderColor = UIColor.purple.cgColor
//        layer.borderWidth = 2
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(userIdLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        setupConstraints()

    }
    
    func setupConstraints() {
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
//        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
//        profileImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -12).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        userIdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        userIdLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        userIdLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -12).isActive = true
        userIdLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        followButton.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        followButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 100).isActive = true


        bioTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 0).isActive = true
        bioTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        bioTextView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        bioTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        
    }
    
}
