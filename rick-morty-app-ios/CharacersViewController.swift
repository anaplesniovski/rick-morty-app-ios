//
//  ViewController.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 28/09/23.
//

import UIKit

class CharactersViewController: UIViewController {
    
    let titleLabel: UILabel
    let label: UILabel
    let textField: UITextField
    let tableView: UITableView
    let dataSource: CharactersDataSource
    
    init() {
        titleLabel = UILabel()
        label = UILabel()
        textField = UITextField()
        tableView = UITableView()
        dataSource = CharactersDataSource(characters: [])
        super.init(nibName: nil, bundle: nil)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchCharacters()
    }
    
    func fetchCharacters() {
        let service = Service()
        let route = RickMortyService.characters

        service.getCharacters(route: route, type: Characters.self) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.dataSource.characters = characters.character
                self?.tableView.reloadData()
            case .failure(let error):
                print("Erro ao buscar personagens: \(error)")
            }
        }
    }
}

extension CharactersViewController: ViewCodable {
    func configure() {
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
    
    func buildHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(tableView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 106),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func render() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "teste"
        titleLabel.font = .systemFont(ofSize: 32)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "teste"
        titleLabel.font = .systemFont(ofSize: 16)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Qual personagem você está procurando?"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        textField.layer.cornerRadius = 10
        //textField.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
    }
}
