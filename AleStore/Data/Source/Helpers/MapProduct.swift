//
//  MapProduct.swift
//  Data
//
//  Created by Márcio Abrantes on 07/06/23.
//

import Foundation
import CoreData

public class MapProduct {
    public static func makeProductDataToProductModel(productData: ProductData) -> Product {
        var product = Product(name: productData.name ?? "",
                              style: productData.style ?? "",
                              codeColor: productData.codeColor ?? "",
                              colorSlug: productData.colorSlug ?? "",
                              color: productData.color ?? "",
                              image: productData.image ?? "",
                              onSale: productData.onSale,
                              regularPrice: productData.regularPrice ?? "",
                              actualPrice: productData.actualPrice ?? "",
                              discountPercentage: productData.discountPercentage ?? "",
                              installments: productData.installments ?? "")
        return product
    }
    
    public static func makeProductModelToProductData(context: NSManagedObjectContext, product: Product) -> ProductData {
        let productData = ProductData(context: context)
        productData.setValue(product.actualPrice, forKey: "actualPrice")
        productData.codeColor = product.codeColor
        productData.color = product.color
        productData.colorSlug = product.colorSlug
        productData.discountPercentage = product.discountPercentage
        productData.image = product.image
        productData.installments = product.installments
        productData.name = product.name
        productData.onSale = product.onSale
        productData.regularPrice = product.regularPrice
        //productData.sizes = product.sizes
        productData.style = product.style
        return productData
    }
}
