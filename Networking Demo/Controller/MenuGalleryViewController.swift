//
//  MenuGalleryViewController.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/23/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MenuGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // API - URL
    private let url = Network.instance.flickrURLFromParameters()
    private var index = 0 /* will be used to get the index of the tapped cell */
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set delegate & dataSource to the controller
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self

    }
 
    
    // MARK - Segue
    
    // This function notifies the view controller that a segue is about to be performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoGallery = segue.destination as? PhotoGalleryCollectionViewController {
            // Send the specific Gallery that the user has chosen to PhotoGallery.
            // The Gallery that's going to be sent is going to be used to get the appropriate GalleryID for the CollectionView.
            photoGallery.updateGallery(DataSource.instance.getArray[index])
        }
    }
    
    // This function tells the delegate that the item at the specified index path was selected.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.item /* save the index of the tapped item in the idex variable */
        let gallery = DataSource.instance.getArray[index]
        performSegue(withIdentifier: "PhotoGallery", sender: gallery)
    }
    
    // MARK - UICollectionViewDataSource
    
    // Returns the number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSource.instance.getArray.count
    }
    
    // This function will populate the collectionview cells with the appropriate data using MenuGalleryCollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuGalleryCollectionViewCell {
            cell.updateCell(gallery: DataSource.instance.getArray[indexPath.item])
            return cell
        } else {
            return MenuGalleryCollectionViewCell()
        }
    }
}
