//
//  HttpFactories.swift
//  Infra
//
//  Created by Márcio Abrantes on 29/05/23.
//

import Foundation

public class HttpFactories {
    static func makeCatalogList() -> CatalogListProtocol {
        let catalogList = CatalogList()
        return catalogList
    }
}
