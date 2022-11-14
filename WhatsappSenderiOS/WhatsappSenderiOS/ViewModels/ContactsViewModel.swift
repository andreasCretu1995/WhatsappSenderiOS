//
//  ContactsViewModel.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 10/11/22.
//

import LocalAuthentication
import UIKit

final class ContactsViewModel: UIViewController, UINavigationBarDelegate, UISearchBarDelegate, Storyboarded {

    var contacts: [ContactModel]? = []

    @IBOutlet weak var contactsTableView: UITableView!

    let refreshControl = UIRefreshControl()

    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchdata: [ContactModel]? = []
    
    var coordinator: MainCoordinator?
    
    // Create an LAContext
    var context = LAContext()
    
    // Get the supported biometry
    var biometry: LABiometryType?
    
    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {

        super.viewDidLoad()

        navigationController?.navigationBar.delegate = self
        navigationController?.navigationBar.tintColor = .black
        
        title = NSLocalizedString("contacts_view_title_contacts", comment: "Contacts")

        coordinator = MainCoordinator(navigationController: self.navigationController!)
                
        // refreshControl.attributedTitle = NSAttributedString(string: NSLocalizedString("contacts_view_refreshControl_title", comment: "Pull to refresh"))
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        contactsTableView.refreshControl = refreshControl
        
        searchBar.delegate = self
        
        searchBar.placeholder = NSLocalizedString("contacts_view_searchBar_placeholder", comment: "Search")
                
        // Get the supported biometry
        biometry = context.biometryType
    }
    
    func authenticate() {
        
        var error: NSError?
        
        // Check for biometric authentication
        // permissions
        let permissions = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        
        if permissions {
            // Proceed to authentication
            context.evaluatePolicy(
                // .deviceOwnerAuthentication allows
                // biometric or passcode authentication
                .deviceOwnerAuthentication,
                localizedReason: " "
            ) { [self] success, _ in
                if success {
                    appDelegate?.userDefaults.set(true, forKey: Constants().authenticateUserDefaultNameOnContacts)
                    // Handle successful authentication
                    DispatchQueue.main.async { [self] in
                        refresh(nil)
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        if appDelegate?.userDefaults.bool(forKey: Constants().authenticateUserDefaultNameOnContacts) == true {
            refresh(nil)
        } else {
            authenticate()
        }
    }

    @objc func refresh(_ sender: AnyObject?) {
        // Code to refresh table view
        contacts = ContactModel.generateModelArray().sorted(by: { $0.givenName! < $1.givenName! })
        contacts?.insert(ContactModel(identifier: nil, givenName: NSLocalizedString("contacts_view_enter_number", comment: "Enter number"), familyName: nil, phoneNumber: nil), at: 0)
        
        searchdata = contacts
        
        contactsTableView.reloadData()
        
        refreshControl.endRefreshing()
    }
    
    // MARK: - SEARCH BAR DELEGATE METHOD FUNCTION
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        
        searchdata = contacts
        
        searchBar.endEditing(true)
        
        contactsTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchdata = searchText.isEmpty ? contacts : contacts!.filter { (item: ContactModel) -> Bool in
            
            // If dataItem matches the searchText, return true to include it
            
            let condition = item.givenName?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil || item.familyName?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil || item.phoneNumber?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
            return condition
        }
        
        contactsTableView.reloadData()
    }
}

extension ContactsViewModel: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchdata!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.reuseIdentifier, for: indexPath) as? ContactsTableViewCell else {
            fatalError("Unexpected Index Path = \(indexPath.debugDescription)")
        }

        // Fetch Quote
        let contact = searchdata![indexPath.row]

        // Configure Cell
        cell.cellLabel.text = "\(contact.givenName ?? "") \(contact.familyName ?? "") \(contact.phoneNumber ?? "")"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = searchdata![indexPath.row]
        
        if searchBar.text!.isEmpty && indexPath.row == 0 {
            
            // Declare Alert message
            let dialogMessage = UIAlertController(title: NSLocalizedString("contacts_view_enter_number", comment: "Enter number"), message: "", preferredStyle: .alert)
        
            // Add text field
            dialogMessage.addTextField(configurationHandler: { textField in
                textField.placeholder = NSLocalizedString("contacts_view_enter_country_prefix", comment: "Enter country prefix")
                textField.keyboardType = .phonePad
            })
            
            dialogMessage.addTextField(configurationHandler: { textField in
                textField.placeholder = NSLocalizedString("contacts_view_enter_number", comment: "Enter number")
                textField.keyboardType = .phonePad
            })
            
            // Create OK button with action handler
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { [self] _ -> Void in
            
                if let countryPrefix = dialogMessage.textFields?.first?.text, !countryPrefix.isEmpty, var phoneNumber = dialogMessage.textFields?[1].text, !phoneNumber.isEmpty {
                    
                    phoneNumber = "\(countryPrefix)\(phoneNumber)"
                    
                    contact.phoneNumber = phoneNumber
                    
                    coordinator?.goToChatView(contact: contact)
                } else {
                    ErrorMessages.noPhoneNumber.showErrorAlert(viewController: self)
                }
            })
            
            // Create Cancel button with action handlder
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ -> Void in
                print("Cancel button tapped")
            }
            
            // Add OK and Cancel button to dialog message
            dialogMessage.addAction(okAction)
            dialogMessage.addAction(cancel)
            
            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
            coordinator?.goToChatView(contact: contact)
        }
    }
}
