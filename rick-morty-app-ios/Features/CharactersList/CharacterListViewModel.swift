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
}

class CharacteresListViewModel {
    
    private var allCharacters: [Character] = []
    private var filteredCharacter: [Character] = []
    
    var characters: [Character] {
        return filteredCharacter.isEmpty ? allCharacters : filteredCharacter
    }
    
    weak var delegate: CharactersListDelegate?
    private let service: ServiceProtocol
    
    init(delegate: CharactersListDelegate?, service: ServiceProtocol = Service()) {
        self.delegate = delegate
        self.service = service
    }
    
    func fetchCharacters() {
        service.getCharacters(route: RickMortyService.characters, type: Characters.self) { [weak self] result in
            switch result {
            case let .success(model):
                self?.allCharacters = model.character
                self?.filteredCharacter = model.character
                self?.delegate?.didFetchCharacters(characters: model.character)
            case let .failure(error):
                self?.delegate?.showError(error: error)
            }
        }
    }
    
    func filterCharacter(with searchText: String) {
        if searchText.isEmpty {
            filteredCharacter = allCharacters
        } else {
            filteredCharacter = allCharacters.filter { character in
                return character.name.lowercased().contains(searchText.lowercased())
            }
        }
        
        delegate?.didFetchCharacters(characters: characters)
    }
}
