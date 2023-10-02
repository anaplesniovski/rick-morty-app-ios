//
//  CharacterViewModel.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

class CharactersViewModel: CharactersViewModelProtocol {
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        let route = RickMortyService.characters

        service.getCharacters(route: route, type: Characters.self) { result in
            switch result {
            case .success(let characters):
                completion(characters.character)
            case .failure(let error):
                print("Erro ao buscar personagens: \(error)")
                completion(nil)
            }
        }
    }
    
    func downloadImage(from imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("Erro ao baixar a imagem: \(error)")
                completion(nil)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
