//
//  ErrorMessages.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 14/11/22.
//

import UIKit

enum ErrorMessages: Int, CaseIterable {
    
    case noPhoneNumber = 1
    case noMessage = 2
    case couldNotFetch = 3
    case errorSaving = 4
    
    var localizedString: String {
        switch self {
        case .noPhoneNumber:
            return NSLocalizedString("error_noPhoneNumber", comment: "")
                
        case .noMessage:
            return NSLocalizedString("error_noMessage", comment: "")
                
        case .couldNotFetch:
            return NSLocalizedString("error_couldNotFetch", comment: "")
                
        case .errorSaving:
            return NSLocalizedString("error_errorSaving", comment: "")
        }
    }
    
    func showErrorAlert(viewController: UIViewController) {
        
        let alert = UIAlertController(title: "ERROR", message: self.localizedString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
