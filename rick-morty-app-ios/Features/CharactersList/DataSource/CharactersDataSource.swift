//
//  CharactersDataSource.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import UIKit

class CharactersDataSource: NSObject {
    
    var characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
        super.init()
    }
    
    func updateCharacters(characters: [Character]) {
        self.characters = characters
    }
}

extension CharactersDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell else { return UITableViewCell() }
        let model = characters[indexPath.row]
        guard let image = URL(string: model.image) else { return UITableViewCell() }
        if let data = try? Data(contentsOf: image) { cell.customView.updateInformations(image: UIImage(data: data), name: model.name, status: model.status, location: model.location.name)
            
        }
        return cell
    }
}

extension CharactersDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}


