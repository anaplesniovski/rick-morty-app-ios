//
//  RickMortyService.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import Foundation

enum RickMortyService {
    case characters
    case locations
    case episodes
}

extension RickMortyService: Route {
    
    var baseURL: URL {
        URL(string: "https://rickandmortyapi.com/api")!
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/character"
        case .locations:
            return "/location"
        case .episodes:
            return "/episode"
        }
    }
    
    var method: Method {
        switch self {
        case .characters, .episodes, .locations:
            return .GET
        }
    }
}
