//
//  GalleryCollectionViewController.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//
import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

private let reuseIdentifier = "Cell"
private var galleryID = ""

class PhotoGalleryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // API - URL
//    private let url = Network.instance.flickrURLFromParameters()
    private var allPhotosInGallery: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(PhotoGalleryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Reload data
        self.collectionView?.reloadData()
        
        makeNetworkRequest()
        
    }
    
    func updateGallery(_ id: Gallery) {
        galleryID = id.galleryID
    }
    
    // This func makes a network request using Alamofire and parse the JSON data with SwiftyJSON
    private func makeNetworkRequest() {
        Alamofire.request("https://api.flickr.com/services/rest/?method=\(Constant.FlickrParameterValues.GalleryMethod)&api_key=\(Constant.FlickrParameterValues.APIKey)&gallery_id=\(galleryID)&extras=\(Constant.FlickrParameterValues.Extra)&format=\(Constant.FlickrParameterValues.ResponseFormat)&nojsoncallback=\(Constant.FlickrParameterValues.DisableJSONCallback)").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let photoGallery = json["photos"]["photo"].arrayValue
                for photo in photoGallery {
                    self.allPhotosInGallery.append(Photo(json: photo))
                }
                self.collectionView?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    // determines the number of cells or going to be in the collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotosInGallery.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoGalleryCollectionViewCell {
            cell.updateLayout(photo: self.allPhotosInGallery[indexPath.item])
            return cell
        } else {
            print("error")
            return PhotoGalleryCollectionViewCell()
        }
    }
    // this function changes the size of each collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    // this function changes the amount of space between each collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
