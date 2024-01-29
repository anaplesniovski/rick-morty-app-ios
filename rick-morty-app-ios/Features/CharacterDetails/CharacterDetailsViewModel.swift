//
//  CharacterDetailsViewModel.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski on 26/01/24.
//

import UIKit

protocol CharacterDetailsDelegate: AnyObject {
    func didFetchEpisodes(episodes: [Episode])
    func showError(error: Error)
}

class CharacterDetailsViewModel {
    
    weak var delegate: CharacterDetailsDelegate?
    private let service: ServiceProtocol
    
    init(delegate: CharacterDetailsDelegate?, service: ServiceProtocol = Service()) {
        self.delegate = delegate
        self.service = service
    }
    
    func fetchEpisodes() {
        service.getCharacters(route: RickMortyService.episodes, type: Episodes.self) { [weak self] result in
            switch result {
            case let .success(model):
                self?.delegate?.didFetchEpisodes(episodes: model.episode)
            case let .failure(error):
                self?.delegate?.showError(error: error)
            }
        }
    }
}
