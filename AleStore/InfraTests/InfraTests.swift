//
//  InfraTests.swift
//  InfraTests
//
//  Created by Márcio Abrantes on 28/05/23.
//

import XCTest
@testable import Infra

final class InfraTests: XCTestCase {

    func test_alamofire_adapter() {
        let alamofire = AlamofireAdapter()
        let request = CatalogRequest(headers: nil, method: .get, parameters: nil, body: nil)
        XCTAssertEqual(request.path.absoluteString, "http://www.mocky.io/v2/59b6a65a0f0000e90471257d")
        let exp = expectation(description: "waiting")
        alamofire.fecth(url: request.path) { result in
            switch result {
            case .failure: XCTFail("Failure")
            case .success(let data):
                XCTAssertNotNil(data)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    
    func test_use_case_catalog_list(){
        let catalog = CatalogList()
        let exp = expectation(description: "waiting")
        catalog.getList() { root in
            guard let root = root else {
                XCTFail("Objeto vazio")
                return
            }
            XCTAssertTrue(root.products[0].name == "VESTIDO TRANSPASSE BOW")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }

}
