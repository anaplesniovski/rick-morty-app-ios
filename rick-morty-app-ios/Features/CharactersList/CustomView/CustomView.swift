//
//  CustomView.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 30/09/23.
//

import UIKit

class CustomView: UIView {
   
    let image: UIImageView
    let nameLabel: UILabel
    let statusLabel: UILabel
    let locationLabel: UILabel
    
    init() {
        let frame = CGRect.zero
        self.image = UIImageView()
        self.nameLabel = UILabel()
        self.statusLabel = UILabel()
        self.locationLabel = UILabel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateInformations(image: UIImage?, name: String, status: String, location: String) {
        if let image = image {
            self.image.image = image
        }
        
        self.nameLabel.text = name
        self.statusLabel.text = status
        self.locationLabel.text = location
    }
}

extension CustomView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(image)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(locationLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 120),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),

            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            statusLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func render() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = .customFont(type: .regular, size: 16)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.numberOfLines = 0
        statusLabel.font = .customFont(type: .regular, size: 12)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.numberOfLines = 0
        locationLabel.font = .customFont(type: .regular, size: 12)
    }
}
