//
//  CharactersTableViewCell.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    static let identifier: String = "CharactersTableViewCell"
    
    let customView: CustomView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        customView = CustomView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var configure: Character? {
           didSet {
               customView.character = configure
           }
       }
}

extension CharactersTableViewCell: ViewCodable {
    func buildHierarchy() {
        addSubview(customView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func render() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .white
        customView.layer.cornerRadius = 10
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.2
        customView.layer.shadowOffset = CGSize(width: 0, height: 2)
        customView.layer.shadowRadius = 4
    }
}
