//
//  UITableViewCellWithSubtitle.swift
//  Hplus_Products
//
//  Created by Daniel Kong on 4/28/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

extension UIImageView {
    // Extensions must not contain stored properties
//    private var imageUrlString: String?

    func loadImage(_ urlString: String) {
//        imageUrlString = urlString
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in

                if error != nil {
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
//                        if self.imageUrlString == urlString {
                            self.image = UIImage.init(data: data)
//                        }
                    }
                }
            }.resume()
        }
    }
}

class TableViewSubtitleCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
