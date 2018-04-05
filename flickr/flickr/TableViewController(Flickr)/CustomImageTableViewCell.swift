//
//  CustomImageTableViewCell.swift
//  flickr
//
//  Created by Daniel Kong on 4/4/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class CustomImageTableViewCell: UITableViewCell {
    // Model
    var model: PhotoModel? {
        didSet {
            if let urlString = model?.url_m {
                 self.mainImageView.loadImageUsingUrlString(urlString)
            }
            mainTitle.text = model?.title ?? ""
            if model?.title == "Roxanne" {
                mainTitle.text = "I am very long, long \n long, long, \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n long, long \n  text."
            }
        }
    }
    
    // UI
    let mainImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "profile_image")
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    let mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Text ..."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
//        self.clipsToBounds = true
        contentView.addSubview(mainImageView)
        contentView.addSubview(mainTitle)
        setupConstraints()
    }
    
    func setupConstraints() {
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        mainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        mainTitle.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15).isActive = true
        mainTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        mainTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
