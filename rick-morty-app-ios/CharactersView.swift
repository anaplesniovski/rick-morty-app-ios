//
//  CharactersView.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

class CharactersView: UIView {
    
    var titleLabel: UILabel
    var label: UILabel
    var textField: UITextField
    var tableView: UITableView
    var dataSource: CharactersDataSource
    
    init() {
        titleLabel = UILabel()
        label = UILabel()
        textField = UITextField()
        tableView = UITableView()
        dataSource = CharactersDataSource(characters: [])
        super.init(frame: .zero)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(characters: [Character], images: [UIImage?]) {
        dataSource.updateCharacters(characters: characters, images: images)
        tableView.reloadData()
    }
}

extension CharactersView: ViewCodable {
    func configure() {
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
    
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(label)
        addSubview(textField)
        addSubview(tableView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 156),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            textField.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func render() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Characters"
        titleLabel.font = .systemFont(ofSize: 32)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Procure personagens de Rick and Morty pelo nome e usando filtros"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .gray
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Qual personagem você está procurando?"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        textField.layer.cornerRadius = 10
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
    }
}

