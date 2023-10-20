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
    
    lazy var viewModel = CharactersListViewModel(delegate: self)
    
    override func loadView() {
        self.view = CharactersListView()
    }
    
    override func viewDidLoad() {
        viewModel.fetchCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCharacters()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersListViewController: CharactersListDelegate {
    func updateList(filterCharacters: [Character]) {
        DispatchQueue.main.async {
            self.theView.filter(filterCharacters: filterCharacters)
        }
    }
    
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
}

extension CharactersListViewController: CharactersListSearchBarDelegate {
    func didUpdateFilteredCharacter(didFilterCharacters characters: [Character]) {
        self.theView.dataSource.updateCharacters(characters: characters)
    }
}

// func p/ receber todo objeto
