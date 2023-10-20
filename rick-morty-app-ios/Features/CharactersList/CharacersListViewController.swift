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
//    lazy var viewModel = CharactersListViewModel(delegate: self)
    
    override func loadView() {
        self.view = CharactersListView()
    }
    
    override func viewDidLoad() {
  //      viewModel.fetchCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   //     viewModel.fetchCharacters()
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

//extension CharactersListViewController: CharactersListDelegate {
//    func updateList(filterCharacters: [Character]) {
//        DispatchQueue.main.async {
//            self.theView.filter(filterCharacters: filterCharacters)
//        }
//    }
//
//    func didFetchCharacters(characters: [Character]) {
//        DispatchQueue.main.async {
//            self.theView.updateView(characters: characters)
//        }
//    }
//
//    func showError(error: Error) {
//        let alert = UIAlertController(title: "Erro", message: "Houve um problema do nosso lado, por favor, volte mais tarde!", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true, completion: nil)
//    }
//}
//
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
