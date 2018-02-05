//
//  PageCollectionViewCell.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class PhotoGalleryCollectionViewCell: UICollectionViewCell {
    
    // Margin size for: photoContainer, descriptionContainer, viewsLabel, & userLabel.
    let leftMarginConstant: CGFloat = 15
    let rightMarginConstant: CGFloat = -15
    
    // Margin size for galleryImage
    let topImageMarginConstant: CGFloat = 4
    let bottomImageMarginConstant: CGFloat = -4
    let leftImageMarginConstant: CGFloat = 10
    let rightImageMarginConstant: CGFloat = -10
    
    // Multiplier value for the card that contains the photo & description.
    let cardMultiplier: CGFloat = 0.60
    
    // This view will containt the photo
    private let photoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.0431372549, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    // This view will contain the description.
    private let descriptionContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    // This will show the image from Flickr.
    private let galleryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // This label will show how many views the photo has.
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1)
        return label
    }()
    
    // This label will show the name of the owner of the photo.
    private let userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    // This function will feed the data in each cell.
    func updateLayout(photo: Photo) {
        self.galleryImage.af_setImage(withURL: URL(string: photo.imageURL)!)
        self.viewsLabel.text = "Views: \(photo.views)"
        if photo.userName == "" {
            self.userLabel.text = "Photographer: unknown"
        } else {
            self.userLabel.text = "Photographer: \(photo.userName)"
        }
        
    }
    
    // This function will set up the User Interface.
    private func setUpLayout() {
        // add the views to the screen.
        addSubview(descriptionContainer)
        descriptionContainer.addSubview(viewsLabel)
        descriptionContainer.addSubview(userLabel)
        addSubview(photoContainer)
        photoContainer.addSubview(galleryImage)
        
        // activate constraints
        NSLayoutConstraint.activate([
            // photoContainer - constraint
            photoContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            photoContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: cardMultiplier),
            photoContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftMarginConstant),
            photoContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: rightMarginConstant),
            // descriptionContainer - constraint
            descriptionContainer.topAnchor.constraint(equalTo: photoContainer.bottomAnchor, constant: -45),
            descriptionContainer.heightAnchor.constraint(equalTo: photoContainer.heightAnchor, multiplier: cardMultiplier),
            descriptionContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftMarginConstant),
            descriptionContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: rightMarginConstant),
            // galleryImage - constraints
            galleryImage.topAnchor.constraint(equalTo: photoContainer.topAnchor, constant: topImageMarginConstant),
            galleryImage.bottomAnchor.constraint(equalTo: photoContainer.bottomAnchor, constant: bottomImageMarginConstant),
            galleryImage.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor, constant: leftImageMarginConstant),
            galleryImage.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor, constant: rightMarginConstant),
            // viewsLabel - constraints
            viewsLabel.bottomAnchor.constraint(equalTo: userLabel.topAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: leftMarginConstant),
            viewsLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: rightMarginConstant),
            // userLabel - constraints
            userLabel.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor, constant: -10),
            userLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: leftMarginConstant),
            userLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: rightMarginConstant)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
