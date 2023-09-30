//
//  Characters.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import Foundation

struct Characters: Decodable {
    let character: [Character]
    
    enum CodingKeys: String, CodingKey {
        case character = "results"
        
    }
}

struct Character: Decodable {
    let name: String
    let status: String
}
