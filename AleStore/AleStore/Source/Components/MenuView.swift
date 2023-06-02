//
//  MenuView.swift
//  AleStore
//
//  Created by Márcio Abrantes on 31/05/23.
//

import UIKit

public protocol MenuViewDelegate {
    func goItensSale()
    func goShopCar()
}

public class MenuView: UIView {
    public var delegate: MenuViewDelegate?
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private lazy var imageSales: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        let bag = UIImage(named: "bag-sale.png")
        buttonView.setImage(bag, for: .normal)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.goItemSalePage))
        buttonView.addGestureRecognizer(gesture)
        buttonView.isUserInteractionEnabled = true
        return buttonView
    }()
    
    private lazy var imageShopCar: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        let car = UIImage(named: "shopping-cart.png")
        buttonView.setImage(car, for: .normal)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.goShopCar))
        buttonView.addGestureRecognizer(gesture)
        buttonView.isUserInteractionEnabled = true
        return buttonView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goItemSalePage() {
        delegate?.goItensSale()
    }
    
    @objc func goShopCar() {
        delegate?.goShopCar()
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
            contentView.heightAnchor.constraint(equalToConstant: 130),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageSales.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            imageShopCar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageShopCar.leadingAnchor.constraint(equalTo: imageSales.leadingAnchor, constant: 50),
            imageShopCar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
    
}
