//
//  CustomTableViewCell.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "CustomTableViewCell"
    
    private lazy var productView: ProductItemView = {
        let view = ProductItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewCell: ViewManager {
    func viewHierarchy() {
        self.contentView.addSubview(self.productView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productView.topAnchor.constraint(equalTo: topAnchor),
            productView.heightAnchor.constraint(equalToConstant: 70),
            productView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
