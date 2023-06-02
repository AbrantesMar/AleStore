//
//  FlowController.swift
//  AleStore
//
//  Created by Márcio Abrantes on 02/06/23.
//

import Foundation
import UIKit

public class AppDelegateFlowController: UIViewController {
    public var navigation: UINavigationController?
    
    public override func viewDidLoad() {
        if self.navigation == nil {
            super.viewDidLoad()
            
            let uiNavigationController = UINavigationController(rootViewController: HomeViewController())
            uiNavigationController.setNavigationBarHidden(false, animated: true)
            self.navigation = uiNavigationController
        }
    }
    
    public func withNavigationBar() -> AppDelegateFlowController {
        navigation?.setNavigationBarHidden(true, animated: false)
        return self
    }
    
    public func toItemView() {
        let view = ItemViewController()
        navigation?.pushViewController(view, animated: true)
    }

    public func toShopCartView() {
        let view = ShopCartViewController()
        navigation?.pushViewController(view, animated: true)
    }
    
    public func didBackView() {
        navigation?.popViewController(animated: true)
    }
    
    @objc func addTapped() {
        print("")
    }
}
