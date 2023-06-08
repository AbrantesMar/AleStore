//
//  ItemViewModel.swift
//  AleStore
//
//  Created by Márcio Abrantes on 02/06/23.
//

import Foundation
import RxSwift

public class ItemViewModel {
    public var indexPath: PublishSubject<[Int]> = PublishSubject()
    public var image: PublishSubject<String> = PublishSubject()
    public var imageUIImage: PublishSubject<UIImage> = PublishSubject()
    public var name: PublishSubject<String> = PublishSubject()
    public var regularPrice: PublishSubject<String> = PublishSubject()
    public var actualPrice: PublishSubject<String> = PublishSubject()
    public var isHiddenToOnSale: PublishSubject<Bool> = PublishSubject()
    public var sizes: PublishSubject<[String]?> = PublishSubject()
    public var amount: PublishSubject<String> = PublishSubject()
    public var amountResult: Int?
    public var product: Product
    
    private var productRepository: ProductRepositoryProtocol
    
    init(product: Product, productRepository: ProductRepositoryProtocol) {
        self.productRepository = productRepository
        self.product = product
        setup(product: product)
    }
    
    func setup(product: Product) {
        DispatchQueue.main.async {
            self.image.onNext(product.image)
            self.name.onNext(product.name)
            self.regularPrice.onNext(product.regularPrice)
            self.actualPrice.onNext(product.actualPrice)
            self.isHiddenToOnSale.onNext(!product.onSale)
            self.loadImage(for: product.image)
            self.amount.onNext("0")
        }
    }
    
    func addProductInCart() {
        productRepository.addProductInBase(product: self.product, amount: amountResult ?? 0)
    }
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageUIImage.onNext(UIImage(data: data) ?? UIImage())
            }
        }
        task.resume()
    }
}
