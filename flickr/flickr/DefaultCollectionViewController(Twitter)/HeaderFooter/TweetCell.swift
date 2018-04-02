//
//  TweetCell.swift
//  flickr
//
//  Created by Daniel Kong on 4/2/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    var tweet: Tweet? {
        didSet {
            if let t = tweet {
                messageTextView.text = t.message
                profileImageView.image = UIImage(named: t.user.imageString)
            }
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "SOME SAMPLE TEXT"
        tv.backgroundColor = .yellow
        return tv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let seperateLine: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .black
        lineView.alpha = 0.3
        
        return lineView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(profileImageView)
        addSubview(messageTextView)

        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        messageTextView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15).isActive = true
        messageTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        
//        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        addSubview(seperateLine)
        
        seperateLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        seperateLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        seperateLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        seperateLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
