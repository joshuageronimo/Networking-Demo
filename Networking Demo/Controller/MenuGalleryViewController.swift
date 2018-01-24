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
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set delegate & dataSource to the controller
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gallery = DataSource.instance.getArray[indexPath.item]
        performSegue(withIdentifier: "PhotoGallery", sender: gallery)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSource.instance.getArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuGalleryCollectionViewCell {
            cell.updateCell(gallery: DataSource.instance.getArray[indexPath.item])
            return cell
        } else {
            return MenuGalleryCollectionViewCell()
        }
    }
}
