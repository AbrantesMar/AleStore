//
//  ProductRepository.swift
//  Data
//
//  Created by Márcio Abrantes on 30/05/23.
//

import Foundation
import CoreData

public class ProductRepository  {
    private var context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
}
