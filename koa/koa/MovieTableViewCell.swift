//
//  MovieTableViewCell.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    struct Constant {
        static let kImageSidePadding: CGFloat = 5.0
        static let kImageTopPadding: CGFloat = 20.0
        static let kImageSize: CGSize = CGSize(width: 100, height: 100)
        static let kInfoStackSidePadding: CGFloat = 15.0
        static let kInfoStackVerticalPadding: CGFloat = 10.0
        static let kButtonPadding: CGFloat = 5.0
        static let kImagePlaceHolder = UIImage(named: "image_placeholder")
        static let kMovieNameFont = UIFont.systemFont(ofSize: 16)
        static let kArtistNameFont = UIFont.systemFont(ofSize: 14)
        static let kDetailFont = UIFont.systemFont(ofSize: 12)
    }
    
    // UI View
    lazy var movieImageView: CachableImageView = {
        let imageView = CachableImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = Constant.kImagePlaceHolder
        return imageView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.movieTitle, self.artistTitle, self.yearTitle, self.briefIntroLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.spacing = Constant.kButtonPadding
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Movie Title"
        label.numberOfLines = 0
        label.font = Constant.kMovieNameFont
        label.textColor = .darkGray
        return label
    }()
    
    lazy var artistTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Artist Name"
        label.font = Constant.kArtistNameFont
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var yearTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Release Year"
        label.font = Constant.kDetailFont
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var briefIntroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Brief Intro"
        label.numberOfLines = 3
        label.font = Constant.kDetailFont
        label.textColor = .darkGray
        return label
    }()
    
    // Model
    var model: Movie? {
        didSet {
            if let model = model {
                if let urlString = model.artworkUrl100 {
                    movieImageView.loadImageUsingUrlString(urlString)
                }
                movieTitle.text = model.trackName
                artistTitle.text = model.artistName
                yearTitle.text = model.releaseYear
                briefIntroLabel.text = model.shortDescription
            }
            
        }
    }
    
    // Need override for Reuse
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.clipsToBounds = true
        contentView.addSubview(movieImageView)
        contentView.addSubview(infoStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.kImageTopPadding).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.kImageSidePadding).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: Constant.kImageSize.width).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: Constant.kImageSize.height).isActive = true
        
        infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.kInfoStackVerticalPadding).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: Constant.kInfoStackSidePadding).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.kInfoStackSidePadding).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.kInfoStackVerticalPadding).isActive = true
    }
    
    override func prepareForReuse() {
        movieImageView.image = nil
        movieTitle.text = nil
    }
}
