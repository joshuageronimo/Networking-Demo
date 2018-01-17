//
//  PageCollectionViewCell.swift
//  Networking Demo
//
//  Created by Joshua Geronimo on 1/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    private let imageContainer: UIImageView = {
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
        self.backgroundColor = .black
        setUpLayout()
    }
    
    func updateLayout(photo: Photo) {
        self.imageContainer.af_setImage(withURL: URL(string: photo.imageURL) ?? URL(string: "https://stockx-assets.imgix.net/logo/stockx-header-logo-white.svg?auto=compress,format")!)
        self.titleLabel.text = photo.title
        self.viewsLabel.text = "Views: \(photo.views)"
        if photo.userName == "" {
            self.userLabel.text = "Photographer: unknown"
        } else {
            self.userLabel.text = "Photographer: \(photo.userName)"
        }
        
    }
    
    private func setUpLayout() {
        addSubview(imageContainer)
        addSubview(viewsLabel)
        addSubview(userLabel)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            // imageContainer - constraints
            imageContainer.widthAnchor.constraint(equalTo: widthAnchor),
            imageContainer.heightAnchor.constraint(equalTo: heightAnchor),
            // titleLabel - constraints
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            // viewsLabel - constraints
            viewsLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -55),
            viewsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            viewsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            // userLabel - constraints
            userLabel.topAnchor.constraint(equalTo: viewsLabel.bottomAnchor),
            userLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            userLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            userLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
