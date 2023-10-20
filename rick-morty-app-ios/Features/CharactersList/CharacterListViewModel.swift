//
//  CharacterListViewModel.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

protocol CharactersListDelegate: AnyObject {
    func didFetchCharacters(characters: [Character])
    func showError(error: Error)
    func updateList(filterCharacters: [Character])
}

class CharactersListViewModel {
    
    weak var delegate: CharactersListDelegate?
    private let service: ServiceProtocol
    var characters: [Character] = []
    
    init(delegate: CharactersListDelegate, service: ServiceProtocol = Service()) {
        self.delegate = delegate
        self.service = service
    }
    
    func fetchCharacters() {
        service.getCharacters(route: RickMortyService.characters, type: Characters.self) { [weak self] result in
            switch result {
            case let .success(model):
                self?.delegate?.didFetchCharacters(characters: model.character)
            case let .failure(error):
                self?.delegate?.showError(error: error)
            }
        }
    }
    
    var filterCharacter: [Character] = [] {
        didSet {
            delegate?.updateList(filterCharacters: filterCharacter)
        }
    }
    
    func filterCharacters(_ searchText: String) {
        if searchText.isEmpty {
            filterCharacter = characters
        } else {
            let updateCharacters = characters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            filterCharacter = updateCharacters
            delegate?.updateList(filterCharacters: updateCharacters )
        }
    }
}
