//
//  DataTests.swift
//  DataTests
//
//  Created by Márcio Abrantes on 28/05/23.
//

import XCTest
import CoreData
@testable import Data

final class DataTests: XCTestCase {
    private var appContext: NSManagedObjectContext?
    
    func test_make_root_to_coreData() {
        appContext = createInMemoryManagedObjectContext()
        let exp = expectation(description: "waiting")
        RepositoryFactory.makeRootApiToData(context: appContext!) { result in
            print()
            XCTAssertNotNil(result)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
    
    func test_make_get_root_in_db() {
        test_make_root_to_coreData()
        appContext = createInMemoryManagedObjectContext()
        let exp = expectation(description: "waiting")
        RepositoryFactory.makeRootDataToGetInfo(context: appContext!) { result in
            XCTAssertNotNil(result)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    var resultProduct: Product?
    func test_make_insert_product_shop_cart_in_base_data() {
        appContext = createInMemoryManagedObjectContext()
        let exp = expectation(description: "waiting")
        RepositoryFactory.makeProductResult() { [weak self] result in
            guard let self = self,
                    let context = appContext,
                    let productApi = result.products.first else {
                XCTFail("resultado da api está vazia!")
                exp.fulfill()
                return
            }
            let productRepository = ProductRepository(context: context)
            
            self.resultProduct = productApi
            if let resultProduct = self.resultProduct {
                productRepository.addProductInBase(product: resultProduct, amount: 3)
                XCTAssertTrue(true)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
        let exp2 = expectation(description: "waiting")
        RepositoryFactory.makeShopCartDataToGetInfo(context: appContext!) { [weak self] result in
            XCTAssertNotNil(result)
            guard let self = self,
                    let result = result,
                    let productResult = result.products,
                  let resultProduct = self.resultProduct else {
                XCTFail("Não foi possível resgatar dados do banco!")
                exp2.fulfill()
                return
            }
            XCTAssertTrue(resultProduct.actualPrice == productResult.actualPrice)
            exp2.fulfill()
        }
        wait(for: [exp2], timeout: 10)
        
        
    }
    
    func createInMemoryManagedObjectContext() -> NSManagedObjectContext? {
        let bundle = Bundle(for: RootData.self)
        guard let managedObjectModel = NSManagedObjectModel.mergedModel(from: [bundle]) else { return nil }
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
          do {
              try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
          } catch {
              print("Error creating test core data store: \(error)")
              return nil
          }
          
          let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
          managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
          
          return managedObjectContext
      }

}
