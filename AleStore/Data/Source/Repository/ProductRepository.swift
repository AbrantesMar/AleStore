//
//  ProductRepository.swift
//  Data
//
//  Created by Márcio Abrantes on 30/05/23.
//

import Foundation
import CoreData

public protocol ProductRepositoryProtocol {
    func fetchProducts(completion: @escaping (ProductsResult?) -> Void)
    func fetchImageProduct(for urlString: String, completion: @escaping (Data?) -> Void)
}

public final class ProductRepository: ProductRepositoryProtocol {

    //private var context: NSManagedObjectContext
    
    public init() {
        
    }
    
    public func fetchProducts(completion: @escaping (ProductsResult?) -> Void) {
        let catalogList = CatalogList()
        catalogList.getList() { response in
            guard let product = response else {
                completion(nil)
                return
            }
            completion(product)
        }
    }
    
    public func fetchImageProduct(for urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        task.resume()
    }
}
