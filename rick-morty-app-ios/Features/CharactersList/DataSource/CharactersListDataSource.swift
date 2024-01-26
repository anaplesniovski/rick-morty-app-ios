//
//  CharactersDataSource.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import UIKit

protocol DidSelectCharacterDelegate: AnyObject {
    func didSelectCharacter(selectedCharacter: Character)
}

class CharactersListDataSource: NSObject {
    
    var characters: [Character]
    weak var delegate: DidSelectCharacterDelegate?

    init(characters: [Character]) {
        self.characters = characters

        super.init()
    }

    func updateCharacters(characters: [Character]) {
        self.characters = characters
    }
}

extension CharactersListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell else { return UITableViewCell() }
        
        let model = characters[indexPath.row]
        
        if let imageUrl = URL(string: model.image) {
            downloadImage(from: imageUrl) { (image) in
                DispatchQueue.main.async {
                    cell.customView.updateInformations(image: image, name: model.name, status: model.status, location: model.location.name)
                }
            }
        }
        
        return cell
    }

    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}

extension CharactersListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        delegate?.didSelectCharacter(selectedCharacter: selectedCharacter)
    }
}


