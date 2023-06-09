//
//  Size.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

// MARK: - Size
public struct Size: Model {
    var available: Bool
    var size: String
    var sku: String
    
    public init(available: Bool, size: String, sku: String) {
        self.available = available
        self.size = size
        self.sku = sku
    }
}
