//
//  ViewManager.swift
//  AleStore
//
//  Created by Márcio Abrantes on 31/05/23.
//

import Foundation

public protocol ViewManager {
    func viewHierarchy()
    func setupConstraints()
}

public extension ViewManager {
    func setup() {
        viewHierarchy()
        setupConstraints()
    }
    
    func viewHierarchy() {}
    func setupConstraints() {}
}
