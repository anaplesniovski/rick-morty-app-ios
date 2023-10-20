//
//  SearchBar.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 13/10/23.
//

import UIKit

protocol CharactersListSearchBarDelegate: AnyObject {
    func didUpdateFilteredCharacter(didFilterCharacters characters: [Character])
}

class CharactersListSearchBar: NSObject {
    
    var characters: [Character]
    var filterCharacters: [Character] = []
    weak var delegate: CharactersListSearchBarDelegate?
    
    init(characters: [Character]) {
       self.characters = characters
       self.filterCharacters = characters
    }
    
    func filterUpdate() {
        
    }
}

extension CharactersListSearchBar: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterCharacters = characters
        //self.filterCharacters = characters.filter { $0.name.lowercased().contains(searchText.lowercased())}
        filterCharacters(searchText: searchText)
        delegate?.didUpdateFilteredCharacter(didFilterCharacters: filterCharacters)
}
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func filterCharacters(searchText: String) -> [Character] {
        self.filterCharacters = characters.filter { $0.name.lowercased().contains(searchText.lowercased())}
        return filterCharacters
        
    }
    
}
