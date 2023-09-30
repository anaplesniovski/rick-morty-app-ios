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
}

extension CharactersDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure = character
        return cell
    }
}

extension CharactersDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}
