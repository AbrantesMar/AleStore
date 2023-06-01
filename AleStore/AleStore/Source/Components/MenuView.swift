//
//  MenuView.swift
//  AleStore
//
//  Created by Márcio Abrantes on 31/05/23.
//

import UIKit

public class MenuView: UIView {
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var imageSales: IconButton = {
        let icon = IconButton(to: "bag-sale.png")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var imageShopCar: IconButton = {
        let icon = IconButton(to: "shopping-cart.png")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView: ViewManager {
    public func viewHierarchy() {
        super.addSubview(contentView)
        contentView.addSubview(imageSales)
        contentView.addSubview(imageShopCar)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 50),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            imageSales.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            imageShopCar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageShopCar.leadingAnchor.constraint(equalTo: imageSales.leadingAnchor, constant: 25),
            imageShopCar.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
}
