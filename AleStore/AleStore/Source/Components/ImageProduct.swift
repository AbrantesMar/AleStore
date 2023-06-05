//
//  ImageProduct.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

public class ImageProduct: UIView {
    public lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    public lazy var viewSale: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.alpha = 0.9
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
    }()
    
    private lazy var saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sale"
        label.textColor = .black
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ImageProduct: ViewManager {
    public func viewHierarchy() {
        super.addSubview(contentView)
        contentView.addSubview(imageView)
        imageView.addSubview(viewSale)
        viewSale.addSubview(saleLabel)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 50),
            contentView.widthAnchor.constraint(equalToConstant: 200),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            viewSale.heightAnchor.constraint(equalToConstant: 30),
            viewSale.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            viewSale.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            viewSale.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            viewSale.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),

            saleLabel.topAnchor.constraint(equalTo: viewSale.topAnchor),
            saleLabel.heightAnchor.constraint(equalTo: viewSale.heightAnchor),
            saleLabel.widthAnchor.constraint(equalTo: viewSale.widthAnchor),
            saleLabel.leadingAnchor.constraint(equalTo: viewSale.leadingAnchor),
            saleLabel.trailingAnchor.constraint(equalTo: viewSale.trailingAnchor, constant: -20),
            saleLabel.bottomAnchor.constraint(equalTo: viewSale.bottomAnchor),
        ])
    }
}
