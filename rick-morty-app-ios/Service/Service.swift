//
//  Service.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import Foundation
import UIKit

enum Method: String {
    case POST, GET, DELETE, PUT
}

protocol Route {
    var baseURL: URL { get }
    var path: String { get }
    var method: Method { get }
}

protocol ServiceProtocol {
    func getCharacters<T: Decodable>(route: Route, type: T.Type, callback: @escaping (Result<T,Error>) -> Void)
    func downloadImage(from imageURL: URL, callback: @escaping (Result<UIImage, Error>) -> Void)
}

class Service: ServiceProtocol {
    
    private let urlSession: URLSession
    
    init(
        urlSession: URLSession = .shared
    ) {
        self.urlSession = urlSession
    }
    
    func getCharacters<T: Decodable>(route: Route, type: T.Type = T.self, callback: @escaping (Result<T, Error>) -> Void) {
        switch route.method {
        case .GET:
            get(route: route, callback: callback)
        default:
            break
        }
    }
    
    private func get<T: Decodable>(route: Route, callback: @escaping (Result<T, Error>) -> Void) {
        var url = route.baseURL
        url.append(path: route.path)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error {
                callback(.failure(error))
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(T.self, from: data)
                        callback(.success(json))
                    } catch (let error) {
                        callback(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(from imageURL: URL, callback: @escaping (Result<UIImage, Error>) -> Void) {
        let request = URLRequest(url: imageURL)
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                callback(.failure(error))
                return
            }
            if let data = data, let image = UIImage(data: data) {
                callback(.success(image))
            }
        }
        task.resume()
    }
}
