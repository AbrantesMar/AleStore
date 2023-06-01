//
//  CatalogList.swift
//  Infra
//
//  Created by Márcio Abrantes on 29/05/23.
//

import Foundation
import Domain

public protocol CatalogListProtocol {
    func getList(completion: @escaping (ProductsResult?) -> Void)
}

public final class CatalogList: CatalogListProtocol {
    private let request: CatalogRequest
    private let httpClientProtocol: HttpClientProtocol
    
    public init() {
        self.request = CatalogRequest(headers: nil,
                                      method: .get,
                                      parameters: nil,
                                      body: nil)
        httpClientProtocol = AlamofireAdapter()
    }
    
    public func getList(completion: @escaping (ProductsResult?) -> Void) {
        
        httpClientProtocol.fecth(url: request.path) { result in
            self.handleProducts(result: result) { root in
                completion(root)
            }
        }
    }
    
    private func handleProducts(result: Result<ProductsResult?, HttpError>,
                                completion: @escaping (ProductsResult?) -> Void) {
        switch result {
        case .failure(let error):
            print("Request error: \(error.localizedDescription)")
            completion(nil)
        case .success(let root):
            completion(root)
        }
    }
}
