//
//  CharactersDataSource.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import UIKit

class CharactersDataSource: NSObject {
    
    var characters: [Character]
    var images: [UIImage?] = []
    var viewModel: CharactersViewModel?
    
    init(characters: [Character]) {
        self.characters = characters
        super.init()
    }
    
    func updateCharacters(characters: [Character], images: [UIImage?]) {
        self.characters = characters
        self.images = images
    }
}

extension CharactersDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell else { return UITableViewCell() }
        let model = characters[indexPath.row]
        let image = viewModel?.downloadedImages[indexPath.row]
        cell.customView.updateInformations(image: image, name: model.name, status: model.status)
        return cell
    }
}

extension CharactersDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}
