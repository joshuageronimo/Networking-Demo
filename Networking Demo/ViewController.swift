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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // API - URL
        let url = Link.instance.flickrURLFromParameters()
        // Make request
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                print("JSON: \(json["photos"]["photo"][0]["id"].stringValue)")
            case .failure(let error):
                print(error)
            }
        }
    }
}

