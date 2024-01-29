//
//  CustomLabel.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski on 24/01/24.
//

import UIKit

class CustomLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
