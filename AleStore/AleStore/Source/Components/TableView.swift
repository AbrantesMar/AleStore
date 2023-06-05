//
//  TableView.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

public protocol TableViewDelegate {
    func selectedItem(indexPath: [Int])
}

public class TableView: UIView {
    
    public var delegate: TableViewDelegate?
    private var selectedItem: Product?
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableView: ViewManager {
    public func viewHierarchy() {
        super.addSubview(tableView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension TableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedItem(indexPath: [0])
    }
}
