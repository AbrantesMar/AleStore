//
//  ViewController+CoreData.swift
//  AleStore
//
//  Created by Márcio Abrantes on 31/05/23.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let application = UIApplication.shared.delegate as! AppDelegate
        return application.persistentContainer.viewContext
    }
    
    var flowController: AppDelegateFlowController? {
        let application = UIApplication.shared.delegate as! AppDelegate
        return application.flowController 
    }
}
