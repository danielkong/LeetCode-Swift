//
//  FlickrConstants.swift
//  flickr
//
//  Created by Daniel Kong on 3/22/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

// MARK:

extension BaseClientAPI {
    
    struct FlickrConstants {
        static let ApiPath = "https://api.flickr.com/services/rest/"
    }
    
//    "extras": "url_m", "text": "monkey", "safe_search": "1", "method": "flickr.photos.search", "api_key": "277f27da8244dc7868a790f302171a65", "format": "json", "nojsoncallback":"1", "per_page": "10"
    struct methods {
        static let PhotoSearch = "flickr.photos.search"
    }
    
    struct ParameterKeys {
        static let ApiKey = "api_key"
        static let SafeSearch = "safe_search"
        static let Text = "text"
        static let Extras = "extras"
        static let Format = "format"
        static let NoJSONCallback = "nojsoncallback"
        static let PerPage = "per_page"
    }
    
    struct ParameterValues {
        static let SafeSearchValue = "1"
        static let TextValue = "monkey"
        static let ExtrasValue = "url_m"
        static let FormatValue = "json"
        static let NoJSONCallbackValue = "1"
        static let PerPageValue = "10"
    }
    
    struct JSONResponseKeys {
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"

        // MARK: Monkey
        static let id = "id"
        static let owner = "owner"
        static let secret = "secret"
        static let url_m = "url_m"
        static let height_m = "height_m"
        static let width_m = "width_m"
        static let title = "title"
    }
}
