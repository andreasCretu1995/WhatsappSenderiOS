//
//  HistoryViewModel.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 10/11/22.
//

import CoreData
import LocalAuthentication
import UIKit

final class HistoryViewModel: UIViewController, UINavigationBarDelegate, UISearchBarDelegate, Storyboarded {

    var coordinator: MainCoordinator?
    
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var messageHistoryTableView: UITableView!
    
    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate

    var context: NSManagedObjectContext?
    
    var entity: NSEntityDescription?
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Messages")
    
    var messages: [NSManagedObject] = []
    
    var searchdata: [NSManagedObject]! = []
    
    var contacts: [ContactModel]? = []
    
    // Create an LAContext
    var authContext = LAContext()
    
    // Get the supported biometry
    var biometry: LABiometryType?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        navigationController?.navigationBar.delegate = self
        navigationController?.navigationBar.tintColor = .black
        
        title = NSLocalizedString("history_view_title_history", comment: "History")
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        coordinator = MainCoordinator(navigationController: self.navigationController)

        // refreshControl.attributedTitle = NSAttributedString(string: NSLocalizedString("contacts_view_refreshControl_title", comment: "Pull to refresh"))
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        searchBar?.delegate = self
        
        searchBar?.placeholder = NSLocalizedString("contacts_view_searchBar_placeholder", comment: "Search")
        
        messageHistoryTableView?.refreshControl = refreshControl
        
        context = appDelegate?.persistentContainer.viewContext
        
        entity = NSEntityDescription.entity(forEntityName: Constants().messagesEntity, in: context!)!
    
        contacts = ContactModel.generateModelArray()
        
        // Get the supported biometry
        biometry = authContext.biometryType
    }
    
    func authenticate() {
        
        var error: NSError?
        
        // Check for biometric authentication
        // permissions
        let permissions = authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        
        if permissions {
            // Proceed to authentication
            authContext.evaluatePolicy(
                // .deviceOwnerAuthentication allows
                // biometric or passcode authentication
                .deviceOwnerAuthentication,
                localizedReason: " "
            ) { [self] success, _ in
                if success {
                    appDelegate?.userDefaults.set(true, forKey: Constants().authenticateUserDefaultNameOnHistory)
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
        
        if appDelegate?.userDefaults.bool(forKey: Constants().authenticateUserDefaultNameOnHistory) == true || AppDelegate.isRunningTest {
            refresh(nil)
        } else {
            authenticate()
        }
    }
    
    @objc func refresh(_ sender: AnyObject?) {
        // Code to refresh table view
        fetchMessages()
        messageHistoryTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func fetchMessages() {
        
        do {
            let query = NSPredicate(format: "contactPhoneNumber != nil")
            
            fetchRequest.predicate = query
            
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sendedDate", ascending: false)]
            
            messages = try context!.fetch(fetchRequest)
            
            searchdata = messages
        } catch let error as NSError {
            ErrorMessages.couldNotFetch.showErrorAlert(viewController: self)
        }
    }
    
    // MARK: - SEARCH BAR DELEGATE METHOD FUNCTION
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        
        fetchMessages()
        
        searchBar.endEditing(true)
        
        messageHistoryTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchdata = searchText.isEmpty ? messages : messages.filter { [self] (item: NSManagedObject) -> Bool in
            
            // If dataItem matches the searchText, return true to include it
            let text = item.value(forKeyPath: "text") as? String
            let sendedDate = item.value(forKeyPath: "sendedDate") as? Date
            
            var condition = text!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil || sendedDate?.toString(withFormat: Constants().datesFormat).range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
            if let contactPhoneNumber = item.value(forKeyPath: "contactPhoneNumber") as? String, !contactPhoneNumber.isEmpty {
                
                condition = condition || contactPhoneNumber.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
                
                if let contact = contacts?.filter { $0.phoneNumber == contactPhoneNumber }, !contact.isEmpty {
                    
                    let givenName = !contact.isEmpty ? contact[0].givenName : ""
                    let familyName = !contact.isEmpty ? contact[0].familyName : ""
                    
                    condition = condition || givenName!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil || familyName!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
                }
            }
            
            return condition
        }
        
        messageHistoryTableView.reloadData()
    }
}

extension HistoryViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchdata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.cellReuseIdentifier, for: indexPath) as? ContactsTableViewCell else {
            fatalError("Unexpected Index Path = \(indexPath.debugDescription)")
        }
        
        // Configure Cell
        let message = searchdata[indexPath.row]
        
        // Configure Cell
        let text = message.value(forKeyPath: "text") as? String
        let sendedDate = message.value(forKeyPath: "sendedDate") as? Date
        
        var auxTitle: String? = ""
        
        cell.cellLabel.text = ""
        
        if let contactPhoneNumber = message.value(forKeyPath: "contactPhoneNumber") as? String, !contactPhoneNumber.isEmpty {
            
            auxTitle = contactPhoneNumber
            
            if let contact = contacts?.filter({ $0.phoneNumber == contactPhoneNumber }), !contact.isEmpty {
             
                auxTitle = "\(contact[0].givenName ?? "") \(contact[0].familyName ?? "")"
            }
            
            cell.cellLabel.text = "\(sendedDate!.toString(withFormat: Constants().datesFormat)) \(auxTitle!) \(text!)"
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let message = searchdata?[indexPath.row] else {
            return
        }
        
        coordinator?.goToMessageDetailView(message: message)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactsTableViewCell.heightForRowAt;// Choose your custom row height
    }
}
