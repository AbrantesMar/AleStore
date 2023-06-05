//
//  ItemViewController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit
import RxSwift

public class ItemViewController: UIViewController {
    
    public var viewModel: ItemViewModel?
    let disposeBag = DisposeBag()
    
    private lazy var contentArea: UIView = {
        let contentArea = UIView()
        contentArea.translatesAutoresizingMaskIntoConstraints = false
        contentArea.backgroundColor = .white
        return contentArea
    }()
    
    private lazy var menuView: MenuView = {
        let menu = MenuView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.delegate = self
        return menu
    }()
    
    private lazy var imageProduct: ImageProduct = {
        let view = ImageProduct()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "P, M, G"
        label.textColor = .black
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private lazy var actualPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private lazy var buttonShopCar: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.addCar))
        buttonView.addGestureRecognizer(gesture)
        buttonView.isUserInteractionEnabled = true
        return buttonView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getItems()
        setup()
    }
    
    @objc func addCar() {
        flowController?.toShopCartView()
    }

}

extension ItemViewController: ViewManager {
    public func bindViewModel(){
        viewModel?.regularPrice.bind(to: priceLabel.rx.text).disposed(by: disposeBag)
        viewModel?.actualPrice.bind(to: actualPriceLabel.rx.text).disposed(by: disposeBag)
        viewModel?.name.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel?.imageUIImage.bind(to: imageProduct.imageView.rx.image).disposed(by: disposeBag)
        viewModel?.isHiddenToOnSale.bind(to: imageProduct.viewSale.rx.isHidden).disposed(by: disposeBag)
        viewModel?.isHiddenToOnSale.subscribe(onNext: { [weak self] in
            self?.priceLabel.textColor = $0 ? .black : .lightGray
            self?.actualPriceLabel.isHidden = $0
        })
        
    }
    
    public func viewHierarchy() {
        view.addSubview(contentArea)
        contentArea.addSubview(menuView)
        contentArea.addSubview(imageProduct)
        contentArea.addSubview(sizeLabel)
        contentArea.addSubview(titleLabel)
        contentArea.addSubview(actualPriceLabel)
        contentArea.addSubview(priceLabel)
        contentArea.addSubview(buttonShopCar)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            contentArea.topAnchor.constraint(equalTo: view.topAnchor),
            contentArea.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            menuView.topAnchor.constraint(equalTo: contentArea.topAnchor),
            menuView.heightAnchor.constraint(equalToConstant: 80),
            menuView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            menuView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            menuView.widthAnchor.constraint(equalTo: contentArea.widthAnchor),
            menuView.bottomAnchor.constraint(equalTo: imageProduct.topAnchor),
            
            imageProduct.heightAnchor.constraint(equalToConstant: 100),
            imageProduct.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            imageProduct.bottomAnchor.constraint(equalTo: sizeLabel.topAnchor),
            imageProduct.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            imageProduct.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            
            sizeLabel.heightAnchor.constraint(equalToConstant: 20),
            sizeLabel.topAnchor.constraint(equalTo: imageProduct.bottomAnchor),
            sizeLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor),
            sizeLabel.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            sizeLabel.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: actualPriceLabel.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),

            actualPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            actualPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            actualPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            actualPriceLabel.bottomAnchor.constraint(equalTo: buttonShopCar.bottomAnchor, constant: -20),

            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.bottomAnchor.constraint(equalTo: buttonShopCar.bottomAnchor, constant: -20),
            priceLabel.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            
            buttonShopCar.heightAnchor.constraint(equalToConstant: 20),
            buttonShopCar.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            buttonShopCar.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            buttonShopCar.widthAnchor.constraint(equalTo: contentArea.widthAnchor),
            buttonShopCar.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor, constant: -20)
        ])
    }
}

extension ItemViewController: MenuViewDelegate {
    public func goItensSale() {
        flowController?.didBackView()
    }
    
    public func goShopCar() {
        flowController?.didBackView()
    }
}
