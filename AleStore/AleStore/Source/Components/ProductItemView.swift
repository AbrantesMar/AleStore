//
//  ProductItemView.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

public class ProductItemView: UIView {
    private lazy var contentImage: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .lightGray
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
        return contentInfo
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "foto.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleView = UILabel()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = "Name Item"
        return titleView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 50,00"
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var priceSaleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 30,00"
        return label
    }()
    
    private lazy var saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sale"
        return label
    }()
    
    private lazy var buttonSelectedView: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        let chevron = UIImage(named: "chevron-right.png")
        buttonView.setImage(chevron, for: .normal)
        return buttonView
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
        contentButton.addSubview(buttonSelectedView)
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
            
            buttonSelectedView.widthAnchor.constraint(equalTo: contentButton.widthAnchor),
            buttonSelectedView.heightAnchor.constraint(equalToConstant: 30),
            buttonSelectedView.topAnchor.constraint(equalTo: contentButton.topAnchor),
            buttonSelectedView.leadingAnchor.constraint(equalTo: contentButton.leadingAnchor),
            
            buttonDeleteView.widthAnchor.constraint(equalTo: contentButton.widthAnchor),
            buttonDeleteView.heightAnchor.constraint(equalToConstant: 30),
            buttonDeleteView.topAnchor.constraint(equalTo: buttonSelectedView.bottomAnchor, constant: 40),
            buttonDeleteView.leadingAnchor.constraint(equalTo: contentButton.leadingAnchor)

        ])
    }
}
