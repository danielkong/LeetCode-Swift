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
//        tv.backgroundColor = .yellow
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
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
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

        messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        messageTextView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15).isActive = true
        messageTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        
        addSubview(seperateLine)
        seperateLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        seperateLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        seperateLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        seperateLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        

        setupBottomButtons()

    }
    
    fileprivate func setupBottomButtons() {
        let replyButtonContainerView = UIView()
        replyButtonContainerView.translatesAutoresizingMaskIntoConstraints = false

        let retweetButtonContainerView = UIView()
        retweetButtonContainerView.translatesAutoresizingMaskIntoConstraints = false

        let likeButtonContainerView = UIView()
        likeButtonContainerView.translatesAutoresizingMaskIntoConstraints = false

        let directMessageButtonContainerView = UIView()
        directMessageButtonContainerView.translatesAutoresizingMaskIntoConstraints = false

        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

//        let buttonStackView = UIStackView(arrangedSubviews: [replyButton, retweetButton, likeButton, directMessageButton])

        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually

        addSubview(buttonStackView)
        buttonStackView.leadingAnchor.constraint(equalTo: messageTextView.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)

        replyButton.topAnchor.constraint(equalTo: replyButtonContainerView.topAnchor).isActive = true
        replyButton.leadingAnchor.constraint(equalTo: replyButtonContainerView.leadingAnchor).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        retweetButton.topAnchor.constraint(equalTo: retweetButtonContainerView.topAnchor).isActive = true
        retweetButton.leadingAnchor.constraint(equalTo: retweetButtonContainerView.leadingAnchor).isActive = true
        retweetButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        retweetButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        likeButton.topAnchor.constraint(equalTo: likeButtonContainerView.topAnchor).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: likeButtonContainerView.leadingAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        directMessageButton.topAnchor.constraint(equalTo: directMessageButtonContainerView.topAnchor).isActive = true
        directMessageButton.leadingAnchor.constraint(equalTo: directMessageButtonContainerView.leadingAnchor).isActive = true
        directMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        directMessageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
