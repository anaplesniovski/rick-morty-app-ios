//
//  ViewController.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 28/09/23.
//

import UIKit

class CharactersListViewController: UIViewController {
    
    var theView: CharactersListView {
        return view as! CharactersListView
    }
    
    lazy var viewModel = CharacteresListViewModel(delegate: self)
    var charactersListSearchBar: CharactersListSearchBar?
    var dataSource: CharactersListDataSource?
    
    override func loadView() {
        let charactersListView = CharactersListView()
        charactersListView.delegate = self
        self.view = charactersListView
        self.dataSource = charactersListView.dataSource
    }
    
    override func viewDidLoad() {
        viewModel.fetchCharacters()
        dataSource?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCharacters()
        configureSearchBar()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSearchBar() {
        charactersListSearchBar = CharactersListSearchBar()
        charactersListSearchBar?.delegate = self
        charactersListSearchBar?.setupSearchBar(theView.searchBar)
    }
}

extension CharactersListViewController: CharactersListDelegate {
    
    func didFetchCharacters(characters: [Character]) {
        DispatchQueue.main.async {
            self.theView.updateView(characters: characters)
        }
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Erro", message: "Houve um problema do nosso lado, por favor, volte mais tarde!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func didNotFindAnyResults() {
        let alert = UIAlertController(title: "Erro", message: "Desculpe, nennum personagem foi encontrado com esse nome", preferredStyle: .alert)
    }
}

extension CharactersListViewController: SearchBarDelegate {
    func didChangeSearchBar(_ searchText: String) {
        viewModel.filterCharacter(with: searchText)
    }
}
    
extension CharactersListViewController: DidSelectCharacterDelegate {
    func didSelectCharacter(selectedCharacter: Character) {
        let characterDetails = CharacterDetailsViewController()
        characterDetails.theView.configureDetails(with: selectedCharacter)
        navigationController?.pushViewController(characterDetails, animated: true)
    }
}
