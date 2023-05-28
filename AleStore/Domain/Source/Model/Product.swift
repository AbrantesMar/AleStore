//
//  Product.swift
//  Domain
//
//  Created by Márcio Abrantes on 28/05/23.
//

// MARK: - Product
struct Product: Model {
    let name: String
    let style: String
    let codeColor: String
    let colorSlug: String
    let color: String
    let image: String
    let onSale: Bool
    let regularPrice: String
    let actualPrice: String
    let discountPercentage: String
    let installments: String
    let sizes: [Size]

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

