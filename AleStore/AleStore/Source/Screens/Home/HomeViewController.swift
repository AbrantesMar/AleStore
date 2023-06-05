//
//  HomeViewController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 28/05/23.
//

import UIKit
import RxSwift
import RxCocoa

public class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    var viewModel: HomeViewModel?
    let disposeBag = DisposeBag()
    
    private lazy var contentArea: UIView = {
        let contentArea = UIView()
        contentArea.translatesAutoresizingMaskIntoConstraints = false
        contentArea.isUserInteractionEnabled = true
        return contentArea
    }()
    
    private lazy var menuView: MenuView = {
        let menu = MenuView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.delegate = self
        menu.isUserInteractionEnabled = true
        return menu
    }()
    
    private lazy var tableView: TableView = {
        let tableView = TableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        return tableView
    }()
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension HomeViewController: ViewManager {
    public func bindViewModel() {
        
        tableView.tableView.rx.setDelegate(tableView.self).disposed(by: disposeBag)
        
        viewModel?.products.bind(to: tableView.tableView.rx.items(cellIdentifier: CustomTableViewCell.identifier, cellType: CustomTableViewCell.self)) { [weak self] (row,item,cell) in
            cell.productView.titleLabel.text = item.name
            cell.productView.priceLabel.text = item.regularPrice
            cell.productView.priceSaleLabel.text = item.actualPrice
            cell.productView.saleLabel.isHidden = !item.onSale
            //cell.productView.imageView.image = self?.viewModel.makeImageToUrlSession(urlString: item.image)
        }.disposed(by: disposeBag)
    }
    public func viewHierarchy() {
        view.addSubview(contentArea)
        contentArea.addSubview(menuView)
        contentArea.addSubview(tableView)
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
            
            tableView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -100),
            tableView.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor)
        ])
    }
}

extension HomeViewController: MenuViewDelegate {
    public func goItensSale() {
        self.tableView.tableView.reloadData()
        //flowController?.toShopCartView()
    }
    
    public func goShopCar() {
        flowController?.toItemView(indexPath: [0])
    }
}

extension HomeViewController: TableViewDelegate {
    public func selectedItem(indexPath: [Int]) {
        flowController?.toItemView(indexPath: indexPath)
    }
}
