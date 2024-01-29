//
//  Episode.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski on 26/01/24.
//

import Foundation

struct Episodes: Decodable {
    let episode: [Episode]
    
    enum CodingKeys: String, CodingKey {
        case episode = "results"
    }
}

struct Episode: Decodable {
    let name: String
}
