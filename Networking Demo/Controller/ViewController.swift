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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In Love"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: 5655"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User: piaser"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    // API - URL
    let url = Link.instance.flickrURLFromParameters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Up UI
        setUpLayout()
        // Make request
        makeNetworkRequest()
    }
    
    func setUpLayout() {
        view.addSubview(imageContainer)
        view.addSubview(viewsLabel)
        view.addSubview(userLabel)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            // imageContainer - constraints
            imageContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageContainer.heightAnchor.constraint(equalTo: view.heightAnchor),
            // titleLabel - constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            // viewsLabel - constraints
            viewsLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55),
            viewsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            viewsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            // userLabel - constraints
            userLabel.topAnchor.constraint(equalTo: viewsLabel.bottomAnchor),
            userLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            userLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            userLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            ])
    }
    
    func makeNetworkRequest() {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                // url for the image
                let imageURL = URL(string: "\(json["photos"]["photo"][0][Constant.ExtraValue.OriginalSize].stringValue)")
                // url for title
                let title = "\(json["photos"]["photo"][0]["title"].stringValue)"
                // url for views
                let views = "\(json["photos"]["photo"][0][Constant.ExtraValue.Views].stringValue)"
                // url for user
                let userName = "\(json["photos"]["photo"][0]["pathalias"].stringValue)"
                
                // get photo from Flickr
                self.imageContainer.af_setImage(withURL: imageURL!, imageTransition: .flipFromLeft(0.5))
                
                // set title
                self.titleLabel.text = title
                // set views
                self.viewsLabel.text = views
                // set userName
                self.userLabel.text = userName
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

