//
//  AlamofireAdapter.swift
//  Infra
//
//  Created by Márcio Abrantes on 28/05/23.
//

import Foundation
import Alamofire
import Domain

protocol HttpClientProtocol {
    func fecth(url: URL, completion: @escaping (Result<Root?, HttpError>) -> Void)
}

public final class AlamofireAdapter: HttpClientProtocol {
    private let session: Session
    
    public init(session: Session = .default) {
        self.session = session
    }
    
    func fecth(url: URL, completion: @escaping (Result<Root?, HttpError>) -> Void) {
        session.request(url).validate(statusCode: 200...299).responseDecodable(of: Root.self) { response in
            print(response)
            switch  response.result {
            case .failure(_): completion(.failure(.badRequest))
            case .success(let root):
                completion(.success(root))
            }
            
        }
    }
}
