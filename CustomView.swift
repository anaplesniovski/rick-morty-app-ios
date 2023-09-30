//
//  CustomView.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 30/09/23.
//

import UIKit

class CustomView: UIView {
    
    let image: UIImageView
    let stackView: UIStackView
    let nameLabel: UILabel
    let statusLabel: UILabel
    
    init() {
        self.image = UIImageView()
        self.stackView = UIStackView()
        self.nameLabel = UILabel()
        self.statusLabel = UILabel()
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            nameLabel.text = character.name
            statusLabel.text = character.status
        }
    }
}

extension CustomView: ViewCodable {    
    func buildHierarchy() {
        addSubview(image)
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(statusLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -10),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
    
    func render() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Status"

    }
}
