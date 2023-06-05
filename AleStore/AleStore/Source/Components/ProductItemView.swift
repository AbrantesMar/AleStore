//
//  ProductItemView.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

public class ProductItemView: UIView {
    public var isCartType: Bool = false
    
    private lazy var contentImage: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .white
        return content
    }()
    
    private lazy var contentInfo: UIView = {
        let contentInfo = UIView()
        contentInfo.translatesAutoresizingMaskIntoConstraints = false
        return contentInfo
    }()
    
    private lazy var contentButton: UIView = {
        let contentInfo = UIView()
        contentInfo.translatesAutoresizingMaskIntoConstraints = false
        contentInfo.isHidden = !isCartType
        return contentInfo
    }()
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "foto.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let titleView = UILabel()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
    
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()
    
    public lazy var priceSaleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Promoção"
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var textInput: UITextView = {
        let input = UITextView()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.isScrollEnabled = false
        input.backgroundColor = .lightGray
        input.textAlignment = .center
        return input
    }()
    
    private lazy var buttonDeleteView: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        let bagSale = UIImage(named: "x.png")
        buttonView.setImage(bagSale, for: .normal)
        return buttonView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductItemView: ViewManager {
    
    public func viewHierarchy() {
        super.addSubview(contentImage)
        contentImage.addSubview(imageView)
        super.addSubview(contentInfo)
        contentInfo.addSubview(titleLabel)
        contentInfo.addSubview(priceLabel)
        contentInfo.addSubview(priceSaleLabel)
        contentInfo.addSubview(saleLabel)

        super.addSubview(contentButton)
        contentButton.addSubview(textInput)
        contentButton.addSubview(buttonDeleteView)
        
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            contentImage.widthAnchor.constraint(equalTo: widthAnchor, constant: -300),
            contentImage.heightAnchor.constraint(equalToConstant: 100),
            contentImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            contentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            imageView.widthAnchor.constraint(equalTo: contentImage.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: contentImage.heightAnchor),
            imageView.topAnchor.constraint(equalTo: contentImage.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentImage.leadingAnchor),
            
            contentInfo.widthAnchor.constraint(equalTo: contentImage.widthAnchor, constant: 120),
            contentInfo.heightAnchor.constraint(equalToConstant: 100),
            contentInfo.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            contentInfo.leadingAnchor.constraint(equalTo: contentImage.trailingAnchor, constant: 10),

            titleLabel.widthAnchor.constraint(equalTo: contentInfo.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentInfo.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentInfo.leadingAnchor),

            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: contentInfo.leadingAnchor),

            priceSaleLabel.heightAnchor.constraint(equalToConstant: 20),
            priceSaleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceSaleLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),

            saleLabel.widthAnchor.constraint(equalTo: contentInfo.widthAnchor),
            saleLabel.heightAnchor.constraint(equalToConstant: 20),
            saleLabel.topAnchor.constraint(equalTo: priceSaleLabel.bottomAnchor),
            saleLabel.leadingAnchor.constraint(equalTo: contentInfo.leadingAnchor),
            
            contentButton.widthAnchor.constraint(equalToConstant: 30),
            contentButton.heightAnchor.constraint(equalToConstant: 100),
            contentButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            contentButton.leadingAnchor.constraint(equalTo: contentInfo.trailingAnchor, constant: 10),
            
            textInput.widthAnchor.constraint(equalTo: contentButton.widthAnchor),
            textInput.heightAnchor.constraint(equalToConstant: 30),
            textInput.topAnchor.constraint(equalTo: contentButton.topAnchor),
            textInput.leadingAnchor.constraint(equalTo: contentButton.leadingAnchor),
            
            buttonDeleteView.widthAnchor.constraint(equalTo: contentButton.widthAnchor),
            buttonDeleteView.heightAnchor.constraint(equalToConstant: 30),
            buttonDeleteView.topAnchor.constraint(equalTo: textInput.bottomAnchor, constant: 40),
            buttonDeleteView.leadingAnchor.constraint(equalTo: contentButton.leadingAnchor)

        ])
    }
}
