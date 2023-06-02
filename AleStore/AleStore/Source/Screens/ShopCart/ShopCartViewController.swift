//
//  ShopCartViewController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 02/06/23.
//

import Foundation
import UIKit

public class ShopCartViewController: UIViewController {
    private lazy var contentArea: UIView = {
        let contentArea = UIView()
        contentArea.translatesAutoresizingMaskIntoConstraints = false
        contentArea.isUserInteractionEnabled = true
        return contentArea
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "valor Total: R$ 50,00"
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()

    private lazy var tableView: TableView = {
        let tableView = TableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.delegate = self
        return tableView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ShopCartViewController: ViewManager {
    public func viewHierarchy() {
        view.addSubview(contentArea)
        contentArea.addSubview(tableView)
        contentArea.addSubview(priceLabel)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            contentArea.topAnchor.constraint(equalTo: view.topAnchor),
            contentArea.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: priceLabel.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor, constant: -80),
            priceLabel.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: contentArea.widthAnchor),
        ])
    }
}
