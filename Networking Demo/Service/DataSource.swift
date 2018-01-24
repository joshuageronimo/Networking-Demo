//
//  DataSource.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/23/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

class DataSource {
    static let instance = DataSource()
    
    private let itemMenu = [Gallery(galleryNumber: "1", numberOfPhotos: "50"),
                            Gallery(galleryNumber: "2", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "3", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "4", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "5", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "6", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "7", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "8", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "9", numberOfPhotos: "0"),
                            Gallery(galleryNumber: "10", numberOfPhotos: "0"),]
    
    var getArray: [Gallery] {
        get {
            return itemMenu
        }
    }
}
