//
//  MovieDetailViewController.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//
/**
 How UI looks like:
 
 image  | track name
        |   genre | release year
        |   type  | duration time
        | trailer | favorite
 long description
 
 */

import UIKit

class MovieDetailViewController: UIViewController {
    struct Constant {
        static let kNavTitle = "Movie Detail"
        static let kImagePlaceHolder = UIImage(named: "image_placeholder")
        static let kInfoStackSpacing: CGFloat = 10
        static let kTrackNameFont = UIFont.boldSystemFont(ofSize: 18)
        static let kGenreFont = UIFont.systemFont(ofSize: 14)
        static let kDescriptionFont = UIFont.systemFont(ofSize: 14)
        
        static let kButtonStackSpacing: CGFloat = 15
        static let kButtonBorderWidth: CGFloat = 0.5
        static let kButtonBorderCornerRaidus: CGFloat = 5
        static let kButtonHeight: CGFloat = 30
        static let kTrailerImage = UIImage(named: "movie_trailer")
        
        static let kSidePadding: CGFloat = 15.0
        static let kTopPadding: CGFloat = 30.0
        static let kInfoLeadingPadding: CGFloat = 15.0
        static let kDescriptionTopPadding: CGFloat = 20.0
        static let kImageSize = CGSize(width: 100, height: 100)
        
        static let kFavImageSelected = UIImage(named: "fav_red")
        static let kFavImageUnselected = UIImage(named: "fav_default")
    }
    
    var movie: Movie?

    lazy var posterImageView: CachableImageView = {
        let imageView = CachableImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Constant.kImagePlaceHolder
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.trackNameLabel, self.genreAndYearLabel, self.contentAdvisoryRatingAndTimeLabel, self.buttonStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.spacing = Constant.kInfoStackSpacing
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constant.kTrackNameFont
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Movie Name"
        label.accessibilityIdentifier = "Movie Name"
        return label
    }()
    
    lazy var genreAndYearLabel: UILabel = {
        let label = UILabel()
        label.font = Constant.kGenreFont
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Genre | Release Year"
        label.accessibilityIdentifier = "Genre | Release Year"
        return label
    }()
    
    lazy var contentAdvisoryRatingAndTimeLabel: UILabel = {
        let label = UILabel()
        label.font = Constant.kGenreFont
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default Content Rating | Duration Time"
        label.accessibilityIdentifier = "Content Rating | Duration Time"
        return label
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.trailerButton, self.favButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = Constant.kButtonStackSpacing
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var trailerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = Constant.kButtonBorderWidth
        button.layer.cornerRadius = Constant.kButtonBorderCornerRaidus
        button.accessibilityIdentifier = "Trailer Button"
        button.setImage(Constant.kTrailerImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(playTrailer), for: .touchUpInside)
        return button
    }()
    
    lazy var favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = Constant.kButtonBorderWidth
        button.layer.cornerRadius = Constant.kButtonBorderCornerRaidus
        button.accessibilityIdentifier = "Fav Button"
        button.setImage(Constant.kFavImageUnselected?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var longDescription: UILabel = {
        let label = UILabel()
        label.font = Constant.kDescriptionFont
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constant.kNavTitle
        view.backgroundColor = .white

        view.addSubview(posterImageView)
        view.addSubview(infoStackView)
        view.addSubview(longDescription)
        
        uptakeModel()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFavButtonUI()
    }
    
    func setupConstraints() {
        // Adaptive iPhone X
        if #available(iOS 11, *) {
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.kTopPadding).isActive = true
        } else {
            posterImageView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: Constant.kTopPadding).isActive = true
        }
        posterImageView.heightAnchor.constraint(equalToConstant: Constant.kImageSize.width).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: Constant.kImageSize.height).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.kSidePadding).isActive = true
        
        infoStackView.topAnchor.constraint(equalTo: posterImageView.topAnchor).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Constant.kInfoLeadingPadding).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.kSidePadding).isActive = true
        
        // bbutton stack
        buttonStack.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: Constant.kButtonHeight).isActive = true
        
        longDescription.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: Constant.kDescriptionTopPadding).isActive = true
        longDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.kSidePadding).isActive = true
        longDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.kSidePadding).isActive = true
    }
    
    func uptakeModel() {
        if let movie = movie {
            if let urlString = movie.artworkUrl100 {
                posterImageView.loadImageUsingUrlString(urlString)
            }
            trackNameLabel.text = movie.trackName ?? ""
            
            // update genre and release year
            var genreContentArray = [String]()
            if let genre = movie.primaryGenreName {
                genreContentArray.append(genre)
            }
            if let year = movie.releaseYear {
                genreContentArray.append(year)
            }
            genreAndYearLabel.text = genreContentArray.joined(separator: " | ")
            
            // update rating and duration time
            var contentRatingAndTimeArray = [String]()
            if let rating = movie.contentAdvisoryRating {
                contentRatingAndTimeArray.append(rating)
            }
            if let time = movie.durationTime {
                contentRatingAndTimeArray.append(time)
            }
            contentAdvisoryRatingAndTimeLabel.text = contentRatingAndTimeArray.joined(separator: " | ")
            
            // update favorite
            updateFavButtonUI()
            
            // update description
            longDescription.text = movie.longDescription
        }

    }
    
    func updateFavButtonUI() {
        if let movie = movie {
            if favSet.contains(movie) {
                favButton.setImage(Constant.kFavImageSelected?.withRenderingMode(.alwaysOriginal), for: .normal)
            } else {
                favButton.setImage(Constant.kFavImageUnselected?.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
    }
    
    @objc func favButtonTapped() {
        if let movie = movie {
            if favSet.contains(movie) {
                favSet.remove(movie)
            } else {
                favSet.insert(movie)
            }
        }
        updateFavButtonUI()
        Storage.store(Array(favSet), to: .documents, as: "favorites.json")
    }
    
    @objc func playTrailer() {
        if let string = movie?.previewUrl, let link = URL(string: string) {
            UIApplication.shared.open(link)
        }
    }
}

