//
//  HomeViewModel.swift
//  AleStore
//
//  Created by Márcio Abrantes on 28/05/23.
//

import Foundation
import RxSwift

public class HomeViewModel {
    
    var productsResult: PublishSubject<ProductsResult> = PublishSubject()
    var products: PublishSubject<[Product]> = PublishSubject()
    var product: Product?
    
    private var productRepositoryProtocol: ProductRepositoryProtocol
    
    public init(productRepositoryProtocol: ProductRepositoryProtocol) {
        self.productRepositoryProtocol = productRepositoryProtocol
    }
    
    func selectedProduct(product: Product) {
        self.product = product
    }
    
    func getItems() {
        self.productRepositoryProtocol.fetchProducts() { [weak self] result in
            guard let result = result, let self = self else {
                return
            }
            self.productsResult.onNext(result)
            self.products.onNext(result.products)
        }
    }
    
    static func makeImageToUrlSession(for urlString: String) -> UIImage {
        guard let url = URL(string: urlString) else { return UIImage() }
        var image = UIImage()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
        return image
    }
}
