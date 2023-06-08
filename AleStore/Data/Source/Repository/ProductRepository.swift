//
//  ProductRepository.swift
//  Data
//
//  Created by Márcio Abrantes on 30/05/23.
//

import Foundation
import CoreData

public class ProductRepository: ProductRepositoryProtocol {

    private var context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    public func fetchProducts(completion: @escaping (ProductsResult?) -> Void) {
        let catalogList = CatalogList()
        catalogList.getList() { [weak self] response in
            self?.handleFetchProductsResult(response: response) { result in
                completion(result)
            }
        }
    }

    public func handleFetchProductsResult(response: ProductsResult?, completion: @escaping (ProductsResult?) -> Void) {
        guard let product = response else {
            completion(nil)
            return
        }
        completion(product)
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
    
    public func addProductInBase(product: Product, amount: Int) {
        let product = MapProduct.makeProductModelToProductData(context: context, product: product)
        let shopCartData = ShopCart(context: context)
        shopCartData.amount = Int16(amount)
        shopCartData.products = product
        saveContext()
    }
    
    public func deleteProductInBase(product: Product) {
        
    }
    
    public func saveContext() {
        do {
          try context.save()
         } catch {
          print("Error saving")
        }
    }
}
