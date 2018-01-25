//
//  Constant.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/16/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

struct Constant {
    
    // MARK: Flickr
    struct Flickr {
        static let APIScheme = "https"
        static let APIHost = "api.flickr.com"
        static let APIPath = "/services/rest"
    }
    
    // MARK: Flickr Parameters Keys
    struct FlickrParameterKeys {
        static let Method = "method"
        static let APIKey = "api_key"
        static let GalleryID = "gallery_id"
        static let Extras = "extras"
        static let Format = "format"
        static let NoJSONCallback = "nojsoncallback"
    }
    
    // MARK: Flickr Parameter Values
    struct FlickrParameterValues {
        static let GalleryMethod = "flickr.galleries.getPhotos"
        static let APIKey = "e85fd10a7773c7a46f57ccc43817ae66"
        // Full extra value link
        static let Extra = "\(ExtraValue.MediumSizeImage),+\(ExtraValue.Views),+\(ExtraValue.DateTaken),+\(ExtraValue.PathAlias)"
        static let ResponseFormat = "json"
        static let DisableJSONCallback = "1" /* 1 means "yes" */
    }
    
    // all the values for extra
    struct ExtraValue {
        static let MediumSizeImage = "url_m"
        static let Views = "views"
        static let DateTaken = "date_taken"
        static let PathAlias = "path_alias"
    }
}
