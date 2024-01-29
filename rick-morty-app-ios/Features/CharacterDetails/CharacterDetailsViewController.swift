//
//  CharacterDetailsViewController.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 30/11/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    var theView: CharacterDetailsView {
        return view as! CharacterDetailsView
    }
    
    lazy var viewModel = CharacterDetailsViewModel(delegate: self)
    
    override func loadView() {
        self.view = CharacterDetailsView()
    }
    
    override func viewDidLoad() {
        viewModel.fetchEpisodes()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharacterDetailsViewController: CharacterDetailsDelegate {
    func didFetchEpisodes(episodes: [Episode]) { }
    
    func showError(error: Error) { }
}
