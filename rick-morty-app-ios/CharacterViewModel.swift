//
//  CharacterViewModel.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

protocol CharactersViewModelDelegate: AnyObject {
    func didFetchCharacters(characters: [Character], images: [UIImage?])
    func showError(error: Error)
}

class CharactersViewModel {
    
    weak var delegate: CharactersViewModelDelegate?
    private let service: ServiceProtocol
    var downloadedImages: [UIImage?] = []
    private var characters: [Character] = []
    
    init(delegate: CharactersViewModelDelegate, service: ServiceProtocol = Service()) {
        self.delegate = delegate
        self.service = service
    }
    
    func fetchCharacters() {
        let route = RickMortyService.characters
        
        service.getCharacters(route: route, type: Characters.self) { [weak self] result in
            self?.handleFetchCharactersResult(result)
        }
    }
    
    private func handleFetchCharactersResult(_ result: Result<Characters, Error>) {
        switch result {
        case .success(let charactersResponse):
            
            self.characters = charactersResponse.character
            
            let imageURLs = self.characters.map { URL(string: $0.image)}.compactMap { $0 }
            downloadImages(from: imageURLs)
            
        case .failure(let error):
            DispatchQueue.main.async {
                self.delegate?.showError(error: error)
            }
        }
    }
    
    func downloadImages(from imageURLs: [URL]) {
        var downloadedImages: [UIImage?] = []
        let dispatchGroup = DispatchGroup()
        
        for imageURL in imageURLs {
            dispatchGroup.enter()
            
            service.downloadImage(from: imageURL) { result in
                switch result {
                case .success(let image):
                    downloadedImages.append(image)
                    
                case .failure(let error):
                    print("Erro ao baixar imagem \(error)")
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.downloadedImages = downloadedImages
            self.notifyImagesDownloaded()
        }
    }
    
    func notifyImagesDownloaded() {
        DispatchQueue.main.async {
            self.delegate?.didFetchCharacters(characters: self.characters, images: self.downloadedImages)
        }
    }
}
