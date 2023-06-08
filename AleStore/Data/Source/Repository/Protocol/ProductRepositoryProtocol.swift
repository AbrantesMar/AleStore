//
//  ProductRepositoryProtocol.swift
//  Data
//
//  Created by Márcio Abrantes on 30/05/23.
//

import Foundation

public protocol ProductRepositoryProtocol {
    func fetchProducts(completion: @escaping (ProductsResult?) -> Void)
    func fetchImageProduct(for urlString: String, completion: @escaping (Data?) -> Void)
    func addProductInBase(product: Product, amount: Int)
}
