//
//  MenuGalleryCollectionViewCell.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/23/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class MenuGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var galleryNumber: UILabel!
    @IBOutlet weak var photoCount: UILabel!
    
    // This function will feed the data in each cell.
    func updateCell(gallery: Gallery) {
        self.galleryNumber.text = gallery.galleryNumber
        self.photoCount.text = "\(gallery.numberOfPhotos) Photos"
    }
    
    
}
