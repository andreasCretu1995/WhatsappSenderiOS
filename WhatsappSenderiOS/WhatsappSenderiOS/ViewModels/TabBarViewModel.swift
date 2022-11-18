//
//  TabBarControllerViewModel.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

import UIKit

final class TabBarViewModel: UITabBarController, Storyboarded {
    
     func showView(index: Int) {
        
        if index < 0 || index > self.viewControllers!.count {
            return
        }
        
        self.selectedIndex = (index != 0) ? index : 0
        
        self.selectedViewController?.viewWillAppear(true)
    }
}
