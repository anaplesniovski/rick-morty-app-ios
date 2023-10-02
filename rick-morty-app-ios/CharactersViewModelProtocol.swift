//
//  CharacterViewModelProtocol.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 02/10/23.
//

import UIKit

protocol CharactersViewModelProtocol: AnyObject {
    func fetchCharacters(completion: @escaping ([Character]?) -> Void)
    func downloadImage(from imageURL: URL, completion: @escaping (UIImage?) -> Void) 
    
}
