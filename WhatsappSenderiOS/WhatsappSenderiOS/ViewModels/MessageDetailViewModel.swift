//
//  MessageDetailViewModel.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 14/11/22.
//

import CoreData
import UIKit

final class MessageDetailViewModel: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    var message: NSManagedObject?
    
    var contacts: [ContactModel]? = []
    
    @IBOutlet weak var messageTextLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        contacts = ContactModel.generateModelArray()

        let text = message?.value(forKeyPath: "text") as? String
        let sendedDate = message?.value(forKeyPath: "sendedDate") as? Date
        var auxTitle: String? = ""
        
        if let contactPhoneNumber = message?.value(forKeyPath: "contactPhoneNumber") as? String, !contactPhoneNumber.isEmpty {
            
            auxTitle = contactPhoneNumber
            
            if let contact = contacts?.filter({ $0.phoneNumber == contactPhoneNumber }), !contact.isEmpty {
                
                auxTitle = "\(contact[0].givenName ?? "") \(contact[0].familyName ?? "")"
            }
        }
        
        title = message != nil ? "\(sendedDate!.toString(withFormat: Constants().datesFormat)) \(auxTitle!)" : ""
        
        messageTextLabel.text = text
        
        // create a new button
        let button = UIButton(type: .custom)
        // set image for button
        let image = UIImage(named: "chevron.left")
        
        button.setImage(image, for: .normal)
        button.setTitle(" \(NSLocalizedString("back", comment: "Back"))", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        // add function for button
        button.addTarget(self, action: #selector(goToHistoryView), for: .touchUpInside)
        // set frame
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let barButton = UIBarButtonItem(customView: button)
        // assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc private func goToHistoryView() {
        coordinator?.goToRootView()
    }
}
