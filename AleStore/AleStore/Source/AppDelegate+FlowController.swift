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
        start()
    }
    
    public func start() {
        AleStoreFactory.makeRegisterServices(context: context)
        if self.navigation == nil {
            super.viewDidLoad()
            
            let viewModel = HomeViewModel(productRepositoryProtocol: AleStoreFactory.makeProductRepository())
            viewModel.getItems()
            let homeController = HomeViewController(viewModel: viewModel)
            let uiNavigationController = UINavigationController(rootViewController: homeController)
            uiNavigationController.setNavigationBarHidden(false, animated: true)
            self.navigation = uiNavigationController
        }
    }
    
    public func withNavigationBar() -> AppDelegateFlowController {
        navigation?.setNavigationBarHidden(true, animated: false)
        return self
    }
    
    public func toItemView(product: Product) {
        let view = ItemViewController()
        AleStoreFactory.makeRegisterServices(context: context)
        let viewModel = ItemViewModel(product: product, productRepository: AleStoreFactory.makeProductRepository())
        view.viewModel = viewModel
        navigation?.pushViewController(view, animated: true)
    }

    public func toShopCartView() {
        let view = ShopCartViewController()
        navigation?.pushViewController(view, animated: true)
    }
    
    public func didBackView() {
        navigation?.popToRootViewController(animated: true)
    }
    
    @objc func addTapped() {
        print("")
    }
}
