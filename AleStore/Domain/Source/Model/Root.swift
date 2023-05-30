//
//  Root.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

// MARK: - Root
public struct Root: Model {
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products
    }
}


