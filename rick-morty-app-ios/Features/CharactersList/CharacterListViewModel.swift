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

}
