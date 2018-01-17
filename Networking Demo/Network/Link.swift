//
//  Link.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/16/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

class Link {
    
    static let instance = Link()
    
    private let methodParameterKeys = [
        Constant.FlickrParameterKeys.Method : Constant.FlickrParameterValues.GalleryMethod,
        Constant.FlickrParameterKeys.APIKey : Constant.FlickrParameterValues.APIKey,
        Constant.FlickrParameterKeys.GalleryID : Constant.FlickrParameterValues.GalleryID,
        Constant.FlickrParameterKeys.Extras : Constant.FlickrParameterValues.Extra,
        Constant.FlickrParameterKeys.Format : Constant.FlickrParameterValues.ResponseFormat,
        Constant.FlickrParameterKeys.NoJSONCallback : Constant.FlickrParameterValues.DisableJSONCallback]
    
    func flickrURLFromParameters() -> URL {
        
        var components = URLComponents()
        components.scheme = Constant.Flickr.APIScheme
        components.host = Constant.Flickr.APIHost
        components.path = Constant.Flickr.APIPath
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in methodParameterKeys {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
//            if value.contains("url_o") {
//                components.QUERY
//            }
            components.queryItems?.append(queryItem)
            
        }
        return components.url!
    }
}
