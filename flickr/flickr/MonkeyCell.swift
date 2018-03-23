//
//  MonkeyCell.swift
//  flickr
//
//  Created by Daniel Kong on 3/22/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

class MonkeyCell: UITableViewCell {
    // Parameter
    var monkey: Monkey? {
        didSet {
            title.text = monkey?.title
            subtitle.text = monkey?.url_m
            let url = URL(string: (monkey?.url_m)!)
            loadImageWithURL(url!)
        }
    }
    
    // UI
    var title: UILabel = {
        let title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "testing title"
        title.numberOfLines = 1
        return title
    }()
    
    var subtitle: UILabel = {
        let subtitle = UILabel(frame: .zero)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "testing subtitle"
        subtitle.numberOfLines = 5
        return subtitle
    }()
    
    lazy var imgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"cell_image")) // Default image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
//    lazy var detailStackView: UIStackView = {
//        let stackView = UIStackView.init(arrangedSubviews: [self.imgView, self.subtitle])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 10
//        return stackView
//    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.monkey = nil
        
        super.init(style: style, reuseIdentifier: reuseIdentifier) // the common code is executed in this super call
        // code unique to CellOne goes here
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        contentView.addSubview(imgView)

//        contentView.addSubview(detailStackView)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")

    }
    
    func setupConstraints() {
        
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
//        title.bottomAnchor.constraint(equalTo: imgView.topAnchor, constant: 15).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        title.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imgView.trailingAnchor.constraint(equalTo: subtitle.leadingAnchor, constant: -20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 100) .isActive = true
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        imgView.heightAnchor.constraint(lessThanOrEqualToConstant: 80).isActive = true

//        subtitle.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15).isActive = true
        subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true

//        detailStackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15).isActive = true
//        detailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15).isActive = true
//        detailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
//        detailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true

    }
    
    private func loadImageWithURL(_ url:URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let image = UIImage.init(data: data) {
                    DispatchQueue.main.async {
                        self.imgView.image = image
                    }
                }
            }
        }
        task.resume()
    }
}
