//
//  IconButton.swift
//  AleStore
//
//  Created by Márcio Abrantes on 01/06/23.
//

import Foundation
import UIKit

public class IconButton: UIView {
    private var icon: String = ""
    
    private lazy var iconView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = UIView.ContentMode.scaleAspectFit
        //let bagSale = UIImage(named: "shopping-cart.png")
        let bagSale = UIImage(named: icon)
        image.image = bagSale
        return image
    }()
    
    init(to: String) {
        super.init(frame: .zero)
        self.icon = to
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconButton: ViewManager {
    public func viewHierarchy() {
        super.addSubview(iconView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            iconView.widthAnchor.constraint(equalToConstant: 25),
            iconView.heightAnchor.constraint(equalToConstant: 25),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
}
