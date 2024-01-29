//
//  File.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski on 29/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var theView: HomeView {
        return view as! HomeView
    }
    
    override func loadView() {
        self.view = HomeView()
        theView.delegate = self
    }
    
    override func viewDidLoad() {}

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: HomeViewDelegate {
    func didButtonPressed() {
        navigationController?.pushViewController(CharactersListViewController(), animated: true)
    }
}
