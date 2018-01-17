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
    
    // API - URL
    let url = Link.instance.flickrURLFromParameters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make request
        makeNetworkRequest()
    }
    
    func makeNetworkRequest() {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
//                // url for the image
//                let imageURL = URL(string: "\(json["photos"]["photo"][0][Constant.ExtraValue.OriginalSize].stringValue)")
                    print("\(json["photos"]["photo"][0][Constant.ExtraValue.MediumSizeImage].stringValue)")
//                // url for title
//                let title = "\(json["photos"]["photo"][0]["title"].stringValue)"
//                // url for views
//                let views = "\(json["photos"]["photo"][0][Constant.ExtraValue.Views].stringValue)"
//                // url for user
//                let userName = "\(json["photos"]["photo"][0]["pathalias"].stringValue)"
//                
//                // get photo from Flickr
//                self.imageContainer.af_setImage(withURL: imageURL!, imageTransition: .flipFromLeft(0.5))
//
//                // set title
//                self.titleLabel.text = title
//                // set views
//                self.viewsLabel.text?.append(views)
//                // set userName
//                self.userLabel.text?.append(userName)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

