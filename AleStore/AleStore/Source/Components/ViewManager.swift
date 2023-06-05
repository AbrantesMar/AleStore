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
    func bindViewModel()
}

public extension ViewManager {
    func setup() {
        viewHierarchy()
        setupConstraints()
        bindViewModel()
    }
    
    func bindViewModel() {}
    func viewHierarchy() {}
    func setupConstraints() {}
}
