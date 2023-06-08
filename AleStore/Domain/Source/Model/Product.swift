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
    
    public init(name: String, style: String, codeColor: String, colorSlug: String, color: String, image: String, onSale: Bool, regularPrice: String, actualPrice: String, discountPercentage: String, installments: String) { //sizes: [Size]) {
        self.name = name
        self.style = style
        self.codeColor = codeColor
        self.colorSlug = colorSlug
        self.color = color
        self.image = image
        self.onSale = onSale
        self.regularPrice = regularPrice
        self.actualPrice = actualPrice
        self.discountPercentage = discountPercentage
        self.installments = installments
        self.sizes = [Size(available: false, size: "", sku: "")]
    }
}
