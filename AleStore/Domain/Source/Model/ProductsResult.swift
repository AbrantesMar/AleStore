//
//  Root.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

import Foundation
import CoreData

// MARK: - Root
public struct ProductsResult: Model {
    public var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products
    }
}


