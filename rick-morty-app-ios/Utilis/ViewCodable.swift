//
//  ViewCodable.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 29/09/23.
//

import Foundation

public protocol ViewCodable {
    func updateTableView()
    func buildHierarchy()
    func buildConstraints()
    func render()
    func setupView()
}

public extension ViewCodable {
    
    func setupView() {
        updateTableView()
        buildHierarchy()
        buildConstraints()
        render()
    }
    
    func updateTableView() {}
}
