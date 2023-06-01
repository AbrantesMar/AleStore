//
//  Model.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

import Foundation
import CoreData

public protocol Model: Codable { }

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
