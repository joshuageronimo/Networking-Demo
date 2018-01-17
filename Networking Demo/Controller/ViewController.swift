//
//  ViewController.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/15/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    let imageContainer: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    // API - URL
    let url = Link.instance.flickrURLFromParameters()
    //let url = "https://api.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=e85fd10a7773c7a46f57ccc43817ae66&gallery_id=72157692049980335&extras=url_o%2C+views%2C+date_taken%2C+path_alias&format=json&nojsoncallback=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        view.addSubview(imageContainer)
        imageContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageContainer.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        // Make request
        makeNetworkRequest()
        
    }
    
    func makeNetworkRequest() {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                // url for the image
                let imageURL = URL(string: "\(json["photos"]["photo"][0][Constant.ExtraValue.OriginalSize].stringValue)")
                
                print(self.url)
                
                // get photo from Flickr
                self.imageContainer.af_setImage(withURL: imageURL!, imageTransition: .flipFromLeft(0.5))
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

