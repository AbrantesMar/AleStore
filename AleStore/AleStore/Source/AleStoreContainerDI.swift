//
//  AleStoreContainerDI.swift
//  AleStore
//
//  Created by Márcio Abrantes on 02/06/23.
//

import Foundation

protocol AleStoreContainerDIProtocol {
    func register<T>(type: T.Type, component: Any)
    func resolve<T>(type: T.Type) -> T?
}

public class AleStoreContainerDI {
    static let shared = AleStoreContainerDI()

    private init() {}

    var services: [String: Any] = [:]

    func register<T>(type: T.Type, service: Any) {
        services["\(type)"] = service
    }

    func resolve<T>(type: T.Type) -> T {
        return services["\(type)"] as! T
    }
}
