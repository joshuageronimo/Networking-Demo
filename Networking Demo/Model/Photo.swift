//
//  Photo.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation
import SwiftyJSON


// This is the model for the Photo Gallery.
struct Photo {
    private(set) public var imageURL: String
    private(set) public var views: String
    private(set) public var userName: String
    
    init(json: JSON) {
        // url for image
        self.imageURL = "\(json[Constant.ExtraValue.MediumSizeImage].stringValue)"
        // url for views
        self.views = "\(json[Constant.ExtraValue.Views].stringValue)"
        // url for user
        self.userName = "\(json["pathalias"].stringValue)"
    }
}
