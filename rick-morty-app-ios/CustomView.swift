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
    
    init() {
        let frame = CGRect.zero
        self.image = UIImageView()
        self.nameLabel = UILabel()
        self.statusLabel = UILabel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateInformations(image: UIImage?, name: String, status: String) {
        if let image = image {
            self.image.image = image
        }
        
        self.nameLabel.text = name
        self.statusLabel.text = status
    }
}

extension CustomView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(image)
        addSubview(nameLabel)
        addSubview(statusLabel)
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

            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            statusLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func render() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 16)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.numberOfLines = 0
        statusLabel.font = .systemFont(ofSize: 12)
    }
}
