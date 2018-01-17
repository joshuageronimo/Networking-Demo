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
        static let GalleryID = "72157692049980335"
        static let OriginalURL = "url_o"
        static let ResponseFormat = "json"
        static let DisableJSONCallback = "1" /* 1 means "yes" */
    }
}
