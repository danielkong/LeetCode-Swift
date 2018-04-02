//
//  CustomTableViewCell.swift
//  flickr
//
//  Created by Daniel Kong on 4/1/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "default label"
        return label
    }()
    
    var mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.image = UIImage(named: "profile_image")
        mainImageView.contentMode = .scaleAspectFit
        return mainImageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(messageLabel)
        addSubview(mainImageView)
        
        mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }
}
