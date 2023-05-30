//
//  CatalogRequest.swift
//  Infra
//
//  Created by Márcio Abrantes on 29/05/23.
//

import Foundation
import Alamofire

public class CatalogRequest: HttpManagerProtocol {
    private let url = "http://www.mocky.io/"
    private let versionUrl = "v2/"
    private let guidUrl = "59b6a65a0f0000e90471257d"
    public var path: URL {
        return URL(string: url + versionUrl + guidUrl)!
    }
    
    public var headers: HTTPHeaders?
    public var method: HTTPMethod
    public var parameters: [String : Any]?
    public var body: [String : Any]?
    
    public init(headers: HTTPHeaders?,
                method: HTTPMethod,
                parameters: [String : Any]?,
                body: [String : Any]?) {
        self.headers = headers
        self.method = method
        self.parameters = parameters
        self.body = body
    }
}
