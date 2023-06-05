//
//  Product.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

// MARK: - Product
public struct Product: Model {
    var name: String
    var style: String
    var codeColor: String
    var colorSlug: String
    var color: String
    var image: String
    var onSale: Bool
    var regularPrice: String
    var actualPrice: String
    var discountPercentage: String
    var installments: String
    var sizes: [Size]

    enum CodingKeys: String, CodingKey {
        case name, style
        case codeColor = "code_color"
        case colorSlug = "color_slug"
        case color
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case installments, image, sizes
    }
}
