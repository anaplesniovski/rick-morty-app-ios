//
//  CharacterListViewModel.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

protocol CharactersListViewModelProtocol: AnyObject {
    var title: String { get }
    var labelInformation: String { get }
    var searchBarPlaceholder: String { get }
    var characters: [Character] { get }
    func updateSearchBar(searchText: String, characters: [Character])
}

class CharactersListViewModel: CharactersListViewModelProtocol {

    var title: String
    var labelInformation: String
    var searchBarPlaceholder: String
    var characters: [Character]
    var filterData: [Character] = []

    func updateSearchBar(searchText: String, characters: [Character]) {
        if searchText.isEmpty {
            self.filterData = characters
        } else {
            for value in characters {
                if value.name.uppercased().contains(searchText.uppercased()) {
                    self.filterData.append(value)
                }
            }
        }
    }

    init(characters: [Character], searchText: String) {
        self.title = "Characters"
        self.labelInformation = "Procure personagens de Rick and Morty pelo nome e usando filtros"
        self.searchBarPlaceholder = "Qual personagem você está procurando?"
        self.characters = characters
        updateSearchBar(searchText: searchText, characters: characters)
    }

}
