//
//  Model.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

import Foundation

public protocol Model: Codable, Equatable { }

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
