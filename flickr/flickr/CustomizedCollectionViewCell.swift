//
//  CustomizedCollectionViewCell.swift
//  flickr
//
//  Created by Daniel Kong on 3/15/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation
import UIKit

/**
 Note:
 1. override default init need to add init?(coder aDecoder: NSCoder) { ... }
 */
struct CustomsizedCollectionViewCellStyle {
    static let defaultColor = UIColor.yellow
    
}
class CustomizedCollectionViewCell: UICollectionViewCell {
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "image "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(title)

        setupConstraints()
    }
    
    private func setupConstraints() {
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
