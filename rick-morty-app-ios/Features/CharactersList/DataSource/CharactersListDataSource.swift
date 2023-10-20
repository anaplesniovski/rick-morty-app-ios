//
//  CharactersDataSource.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import UIKit

class CharactersListDataSource: NSObject {
    
    var characters: [Character]
//    var filterCharacters: [Character]
//    var searchBar = CharactersListSearchBar(characters: [])
    
    init(characters: [Character]) {
        self.characters = characters
//        self.filterCharacters = []
        super.init()
    }

    func updateCharacters(characters: [Character]) {
        self.characters = characters
    }

//    func updateCharacters(characters: [Character], cell: CharactersTableViewCell, image: UIImage, status: String, location: String) {
//        filterCharacters = []
//        for character in characters {
//            var characterFiltered = self.searchBar.filterCharacters(searchText: character.name)
//            filterCharacters.append(contentsOf: characterFiltered)
//        }
//    }
    
//    func filterUpdate(filterCharacters: [Character]) -> [Character] {
//        self.filterCharacters = filterCharacters
//        return filterCharacters
//    }
}

extension CharactersListDataSource: UITableViewDataSource {
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

extension CharactersListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}


