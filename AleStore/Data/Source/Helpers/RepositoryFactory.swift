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
        var root = RootData()
        var product = ProductData()
        var rootDomain: Any? = nil
        
        for case let product as ProductData? in root.products ?? [] {
            guard let product = product else {
                return nil
            }
            for case let size as SizeData? in product.sizes ?? [] {
                guard let size = size else {
                    return nil
                }
                //var sizeDomain = Size()
                
            }
            print(product ?? "")
        }
        return nil
        
    }
    
    //static func makeCleanCoreData(context: NSManagedObjectContext, completion: @escaping (RootData) -> Void) {
    //    context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    //}
    
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
        /*var request = NSFetchRequest<RootData>(entityName: "RootData")
        var error: NSError?
        if let entities = context.executeFetchRequest(request, error: &error) as? RootData {
            if entities.count > 0 {
                return entities
            }
        }*/
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
}
