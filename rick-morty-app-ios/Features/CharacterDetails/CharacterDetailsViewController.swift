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
    
    override func loadView() {
        self.view = CharacterDetailsView()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
