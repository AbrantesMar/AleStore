//
//  ItemViewController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

public class ItemViewController: UIViewController {
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

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ItemViewController: ViewManager {
    public func viewHierarchy() {
        view.addSubview(contentArea)
        contentArea.addSubview(menuView)
        contentArea.addSubview(imageProduct)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            contentArea.topAnchor.constraint(equalTo: view.topAnchor),
            contentArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            menuView.heightAnchor.constraint(equalToConstant: 100),
            menuView.topAnchor.constraint(equalTo: contentArea.topAnchor),
            menuView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            menuView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            menuView.widthAnchor.constraint(equalTo: contentArea.widthAnchor),
            menuView.bottomAnchor.constraint(equalTo: imageProduct.topAnchor, constant: 20),
            
            imageProduct.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -100),
            imageProduct.topAnchor.constraint(equalTo: menuView.bottomAnchor, constant: 40),
            imageProduct.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            imageProduct.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            imageProduct.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor)

        ])
    }
}

extension ItemViewController: MenuViewDelegate {
    public func goItensSale() {
        dismiss(animated: true, completion: nil)
    }
    
    public func goShopCar() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
