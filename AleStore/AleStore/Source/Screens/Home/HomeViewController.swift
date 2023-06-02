//
//  HomeViewController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 28/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var contentArea: UIView = {
        let contentArea = UIView()
        contentArea.translatesAutoresizingMaskIntoConstraints = false
        contentArea.backgroundColor = .white
        contentArea.isUserInteractionEnabled = true
        return contentArea
    }()
    
    private lazy var menuView: MenuView = {
        let menu = MenuView()
        menu.delegate = self
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.isUserInteractionEnabled = true
        return menu
    }()
    
    private lazy var tableView: TableView = {
        let tableView = TableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController: ViewManager {
    func viewHierarchy() {
        view.addSubview(contentArea)
        contentArea.addSubview(menuView)
        contentArea.addSubview(tableView)
    }
    
    func setupConstraints() {
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
            
            tableView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -100),
            tableView.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor)
        ])
    }
}

extension HomeViewController: MenuViewDelegate {
    func goItensSale() {
        if let navigator = navigationController {
            let itemViewController = ItemViewController()
            navigator.pushViewController(itemViewController, animated: true)
        }
    }
    
    func goShopCar() {
        let itemViewController = ItemViewController()
        let navVC = UINavigationController(rootViewController: itemViewController)
        present(navVC, animated: true)
    }
    
    
}
