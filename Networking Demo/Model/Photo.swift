//
//  Photo.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Photo {

    let imageURLPath = "[Constant.ExtraValue.OriginalSize].stringValue"
    let imageURL: String
    let title: String
    let views: String
    let userName: String
    
    init(json: JSON) {
        // url for image
        self.imageURL = "\(json[Constant.ExtraValue.MediumSizeImage].stringValue)"
        // url for title
        self.title = "\(json["title"].stringValue)"
        // url for views
        self.views = "\(json[Constant.ExtraValue.Views].stringValue)"
        // url for user
        self.userName = "\(json["pathalias"].stringValue)"
    }
}
