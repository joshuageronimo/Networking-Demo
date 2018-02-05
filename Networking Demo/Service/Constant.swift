//
//  Constant.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/16/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

struct Constant {
    
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
