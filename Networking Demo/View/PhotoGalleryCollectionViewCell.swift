//
//  PageCollectionViewCell.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class PhotoGalleryCollectionViewCell: UICollectionViewCell {
    
    // Font Sizes
    let titleSize: CGFloat = 50
    let descriptionSize = 20
    
    // Margin Size
    let topMarginConstant: CGFloat = 10
    let rightMarginConstant: CGFloat = -10
    let leftMarginConstant: CGFloat = 10
    let bottomMarginConstant: CGFloat = -55
    
    private let galleryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In Love"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    func updateLayout(photo: Photo) {
        self.galleryImage.af_setImage(withURL: URL(string: photo.imageURL)!)
        self.titleLabel.text = photo.title
        self.viewsLabel.text = "Views: \(photo.views)"
        if photo.userName == "" {
            self.userLabel.text = "Photographer: unknown"
        } else {
            self.userLabel.text = "Photographer: \(photo.userName)"
        }
        
    }
    
    private func setUpLayout() {
        addSubview(galleryImage)
        addSubview(viewsLabel)
        addSubview(userLabel)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            // imageContainer - constraints
            galleryImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            galleryImage.bottomAnchor.constraint(equalTo: viewsLabel.topAnchor),
            galleryImage.widthAnchor.constraint(equalTo: widthAnchor),
            // titleLabel - constraints
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: topMarginConstant),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftMarginConstant),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: rightMarginConstant),
            // viewsLabel - constraints
            viewsLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: bottomMarginConstant),
            viewsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftMarginConstant),
            viewsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: rightMarginConstant),
            // userLabel - constraints
            userLabel.topAnchor.constraint(equalTo: viewsLabel.bottomAnchor),
            userLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            userLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftMarginConstant),
            userLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: rightMarginConstant)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
