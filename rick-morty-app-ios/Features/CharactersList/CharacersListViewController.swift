//
//  ViewController.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 28/09/23.
//

import UIKit

class CharactersListViewController: UIViewController {
    
    var theView: CharactersListView {
        return view as! CharactersListView
    }
    let service: Service

    override func loadView() {
        self.view = CharactersListView()
    }
    
    override func viewDidLoad() {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    init(service: Service = Service()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
        fetchCharacters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(viewModel: [Character]) {
        theView.viewModel = CharactersListViewModel(characters: viewModel)
    }

    func fetchCharacters() {
        service.getCharacters(route: RickMortyService.characters, type: Characters.self) { [weak self] result in
            switch result {
                case let .success(model):
                DispatchQueue.main.async {
                    self?.updateView(viewModel: model.character)
                }
                case let .failure(error):
                    break
                }
            }
        }

}

//extension CharactersListViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//}
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//
//    func filterCharacters(searchText: String) -> [Character] {
//        self.filterCharacters = characters.filter { $0.name.lowercased().contains(searchText.lowercased())}
//        return filterCharacters
//
//    }
//
//}
