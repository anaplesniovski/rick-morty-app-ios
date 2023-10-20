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

protocol CharactersListViewModelProtocol: AnyObject {
    var title: String { get }
    var labelInformation: String { get }
    var searchBarPlaceholder: String { get }
    var characters: [Character] { get }
}

class CharactersListViewModel: CharactersListViewModelProtocol {

    var title: String
    var labelInformation: String
    var searchBarPlaceholder: String
    var characters: [Character]

    init(characters: [Character]) {
        self.title = "Characters"
        self.labelInformation = "Procure personagens de Rick and Morty pelo nome e usando filtros"
        self.searchBarPlaceholder = "Qual personagem você está procurando?"
        self.characters = characters
    }
    
//    weak var delegate: CharactersListDelegate?
//    private let service: ServiceProtocol
//    var characters: [Character] = []
//
//    init(delegate: CharactersListDelegate, service: ServiceProtocol = Service()) {
//        self.delegate = delegate
//        self.service = service
//    }
//
//    func fetchCharacters() {
//        service.getCharacters(route: RickMortyService.characters, type: Characters.self) { [weak self] result in
//            switch result {
//            case let .success(model):
//                self?.delegate?.didFetchCharacters(characters: model.character)
//            case let .failure(error):
//                self?.delegate?.showError(error: error)
//            }
//        }
//    }

}
