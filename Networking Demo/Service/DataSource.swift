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
    
    private let itemMenu = [
        Gallery(galleryNumber: "1", numberOfPhotos: "50", galleryID: "72157692049980335"),
        Gallery(galleryNumber: "2", numberOfPhotos: "17", galleryID: "72157690781695141"),
        Gallery(galleryNumber: "3", numberOfPhotos: "50", galleryID: "72157689485704142"),
        Gallery(galleryNumber: "4", numberOfPhotos: "46", galleryID: "72157662070816797"),
        Gallery(galleryNumber: "5", numberOfPhotos: "26", galleryID: "72157688502872022"),
        Gallery(galleryNumber: "6", numberOfPhotos: "27", galleryID: "72157690527436754"),
        Gallery(galleryNumber: "7", numberOfPhotos: "47", galleryID: "72157689104576172"),
        Gallery(galleryNumber: "8", numberOfPhotos: "40", galleryID: "72157690671472841"),
        Gallery(galleryNumber: "9", numberOfPhotos: "49", galleryID: "72157667840423149"),
        Gallery(galleryNumber: "10", numberOfPhotos: "14", galleryID: "72157691631406844")
    ]
    
    var getArray: [Gallery] {
        get {
            return itemMenu
        }
    }
}
