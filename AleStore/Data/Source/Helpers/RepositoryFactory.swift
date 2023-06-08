//
//  RepositoryFactory.swift
//  Data
//
//  Created by Márcio Abrantes on 30/05/23.
//

import Foundation
import Domain
import CoreData
import Infra

class RepositoryFactory {
    static func makeRootToData() -> ProductsResult? {
        let root = RootData()
        
        for case let product as ProductData? in root.products ?? [] {
            guard let product = product else {
                return nil
            }
            for case let size as SizeData? in product.sizes ?? [] {
                guard size != nil else {
                    return nil
                }
            }
        }
        return nil
        
    }
    
    static func makeProductResult(completion: @escaping (ProductsResult) -> Void) {
        let catalogList = CatalogList()
        catalogList.getList() { response in
            guard let response = response else {
                return
            }
            completion(response)
        }
    }
    
    static func makeRootApiToData(context: NSManagedObjectContext, completion: @escaping (RootData) -> Void) {
        let catalogList = CatalogList()
        catalogList.getList() { response in
            guard let root = response else {
                return
            }
            
            let rootData = RootData(context: context)
            for product in root.products {
                let productData = ProductData(context: context)
                for size in product.sizes {
                    let sizeData = SizeData(context: context)
                    sizeData.sku = size.sku
                    sizeData.available = size.available
                    sizeData.size = size.size
                    productData.addToSizes(sizeData)
                }
                productData.actualPrice = product.actualPrice
                productData.codeColor = product.codeColor
                productData.color = product.color
                productData.colorSlug = product.colorSlug
                productData.discountPercentage = product.discountPercentage
                productData.image = product.image
                productData.installments = product.installments
                productData.name = product.name
                productData.onSale = product.onSale
                productData.regularPrice = product.regularPrice
                productData.style = product.style
                rootData.addToProducts(productData)
            }
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            completion(rootData)
        }
    }
    
    static func makeRootDataToGetInfo(context: NSManagedObjectContext, completion: @escaping (RootData?) -> Void) {
        makeRootApiToData(context: context) { _ in
            let root: NSFetchRequest<RootData> = RootData.fetchRequest()
            let sortByDate = NSSortDescriptor(key: #keyPath(RootData.products), ascending: false)
            root.sortDescriptors = [sortByDate]
            do {
                let results = try context.fetch(root)
                completion(results.first)
            } catch let error as NSError {
                print("Fetch error: \(error) description: \(error.userInfo)")
                completion(nil)
            }
        }
    }
    
    static func makeShopCartDataToGetInfo(context: NSManagedObjectContext, completion: @escaping (ShopCart?) -> Void) {
        makeRootApiToData(context: context) { _ in
            let root: NSFetchRequest<ShopCart> = ShopCart.fetchRequest()
            let sortByDate = NSSortDescriptor(key: #keyPath(ShopCart.amount), ascending: false)
            root.sortDescriptors = [sortByDate]
            do {
                let results = try context.fetch(root)
                completion(results.first)
            } catch let error as NSError {
                print("Fetch error: \(error) description: \(error.userInfo)")
                completion(nil)
            }
        }
    }
}
