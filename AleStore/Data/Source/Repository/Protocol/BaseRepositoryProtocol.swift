//
//  BaseRepositoryProtocol.swift
//  Data
//
//  Created by Márcio Abrantes on 30/05/23.
//

import Foundation

public protocol BaseRepositoryProtocol {
    func get(id: Int)
    func update<T>(to: T)
    func delete(id: Int)
    func save<T>(to: T)
}
