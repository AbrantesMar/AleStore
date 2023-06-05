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
    
    private var productRepositoryProtocol: ProductRepositoryProtocol
    
    init(indexPath: [Int], productRepositoryProtocol: ProductRepositoryProtocol) {
        self.indexPath.onNext(indexPath)
        self.productRepositoryProtocol = productRepositoryProtocol
    }
    
    func getItems() {
        self.productRepositoryProtocol.fetchProducts() { [weak self] result in
            guard let result = result, let self = self else {
                return
            }
            let itemRandom = Int.random(in: 1..<20)
            self.image.onNext(result.products[itemRandom].image)
            self.name.onNext(result.products[itemRandom].name)
            self.regularPrice.onNext(result.products[itemRandom].regularPrice)
            self.actualPrice.onNext(result.products[itemRandom].actualPrice)
            self.isHiddenToOnSale.onNext(!result.products[itemRandom].onSale)
            self.loadImage(for: result.products[itemRandom].image)
        }
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
