//
//  MainCoordinator.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 11/11/22.
//

import CoreData
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToChatView(contact: ContactModel) {
        
        let viewController = ChatsViewModel.instantiate()
        viewController.coordinator = self
        viewController.contact = contact
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToRootView() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func goToMessageDetailView(message: NSManagedObject) {
        
        let viewController = MessageDetailViewModel.instantiate()
        viewController.coordinator = self
        viewController.message = message
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToHistoryView() {
        
        let viewController = HistoryViewModel.instantiate()
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
