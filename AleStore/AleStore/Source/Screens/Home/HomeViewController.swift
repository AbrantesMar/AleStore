//
//  HomeViewController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 28/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var menuView : MenuView = {
        let menu = MenuView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        menuView.setup()
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: ViewManager {
    func viewHierarchy() {
        view.addSubview(menuView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuView.heightAnchor.constraint(equalToConstant: 100),
            menuView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}
