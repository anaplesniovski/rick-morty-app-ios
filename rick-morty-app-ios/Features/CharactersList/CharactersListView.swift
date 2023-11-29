//
//  CharactersListView.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

class CharactersListView: UIView {
    
    var titleLabel: UILabel
    var label: UILabel
    var searchBar: UISearchBar
    var tableView: UITableView
    var dataSource: CharactersListDataSource
    
    init() {
        titleLabel = UILabel()
        label = UILabel()
        searchBar = UISearchBar()
        tableView = UITableView()
        dataSource = CharactersListDataSource(characters: [])
        super.init(frame: .zero)
        backgroundColor = .white
        self.setupView()
        configureDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(characters: [Character]) {
        dataSource.updateCharacters(characters: characters)
        tableView.reloadData()
    }
    
    func configureDelegate() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}

extension CharactersListView: ViewCodable {
    func configure() {
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }

    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(label)
        addSubview(searchBar)
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

            searchBar.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 5),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            searchBar.heightAnchor.constraint(equalToConstant: 60),

            tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func render() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Characters"
        titleLabel.font = .customFont(type: .bold, size: 32)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Procure personagens de Rick and Morty pelo nome"
        label.font = .customFont(type: .light, size: 16)
        label.numberOfLines = 0
        label.textColor = .gray

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
        searchBar.layer.cornerRadius = 10

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
    }
}


