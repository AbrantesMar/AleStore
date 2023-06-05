//
//  AleStoreFactory.swift
//  AleStore
//
//  Created by Márcio Abrantes on 02/06/23.
//

import Foundation
import UIKit

public class AleStoreFactory {
    static func makeRegisterServices() {
        let container = AleStoreContainerDI.shared
        container.register(type: ProductRepositoryProtocol.self, service: ProductRepository())
    }
    
    static func makeProductRepository() -> ProductRepositoryProtocol {
        let productsResult = AleStoreContainerDI.shared.resolve(type: ProductRepositoryProtocol.self)
        return productsResult
    }
}
