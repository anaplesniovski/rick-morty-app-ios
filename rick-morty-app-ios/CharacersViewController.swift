//
//  ViewController.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 28/09/23.
//

import UIKit

class CharactersViewController: UIViewController {
    
    private lazy var charactersView: CharactersView = {
        let charactersView = CharactersView()
        return charactersView
    }()
    
    lazy var viewModel = CharactersViewModel(delegate: self)
    var imageURLs: [URL] = []
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.fetchCharacters()
    }
    
    override func loadView() {
        self.view = charactersView
    }
}

extension CharactersViewController: CharactersViewModelDelegate {
    func didFetchCharacters(characters: [Character], images: [UIImage?]) {
        DispatchQueue.main.async {
            self.charactersView.updateView(characters: characters, images: images)
        }
    }
    
    func showError(error: Error) {
        print("Erro ao buscar personagens: \(error)")
    }
}
