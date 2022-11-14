//
//  ChatsViewModel.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 11/11/22.
//

import CoreData
import UIKit

final class ChatsViewModel: UIViewController, UISearchBarDelegate, Storyboarded {
    
    var contact: ContactModel!
    
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var chatMessagesTableView: UITableView!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate

    var context: NSManagedObjectContext?
    
    var entity: NSEntityDescription?
        
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Messages")
    
    var messages: [NSManagedObject] = []
    
    var searchdata: [NSManagedObject]!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let auxTitle = (contact.identifier != nil) ? "\(contact.givenName ?? "") \(contact.familyName ?? "")" : "\(contact.phoneNumber!)"
        
        title = "\(NSLocalizedString("chat_view_title_contacts", comment: "Chat")) \(auxTitle)"
        
        // create a new button
        let button = UIButton(type: .custom)
        // set image for button
        let image = UIImage(named: "chevron.left")
        
        button.setImage(image, for: .normal)
        button.setTitle(" \(NSLocalizedString("back", comment: "Back"))", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        // add function for button
        button.addTarget(self, action: #selector(goToRootView), for: .touchUpInside)
        // set frame
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let barButton = UIBarButtonItem(customView: button)
        // assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        
        self.messageTextField.placeholder = NSLocalizedString("chats_view_messageTextField_placeholder", comment: "Message")
        
        searchBar.delegate = self
        
        searchBar.placeholder = NSLocalizedString("contacts_view_searchBar_placeholder", comment: "Search")
        
        // refreshControl.attributedTitle = NSAttributedString(string: NSLocalizedString("contacts_view_refreshControl_title", comment: "Pull to refresh"))
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        chatMessagesTableView.refreshControl = refreshControl
        
        context = appDelegate!.persistentContainer.viewContext
        
        entity = NSEntityDescription.entity(forEntityName: "Messages", in: context!)!
        
        fetchMessages()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        fetchMessages()
        
        chatMessagesTableView.reloadData()
        
        refreshControl.endRefreshing()
    }
    
    func fetchMessages() {
        
        do {
            let query = NSPredicate(format: "contactPhoneNumber LIKE %@", contact.phoneNumber!)
            
            fetchRequest.predicate = query
            
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sendedDate", ascending: false)]
            
            messages = try context!.fetch(fetchRequest)
            
            searchdata = messages
        } catch let error as NSError {
            ErrorMessages.couldNotFetch.showErrorAlert(viewController: self)
        }
    }
    
    @objc private func goToRootView() {
        coordinator?.goToRootView()
    }
    
    // MARK: - SEARCH BAR DELEGATE METHOD FUNCTION
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        
        fetchMessages()
        
        searchBar.endEditing(true)
        
        chatMessagesTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchdata = searchText.isEmpty ? messages : messages.filter { (item: NSManagedObject) -> Bool in
            
            // If dataItem matches the searchText, return true to include it
            let text = item.value(forKeyPath: "text") as? String
            let sendedDate = item.value(forKeyPath: "sendedDate") as? Date
            
            let condition = text!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil || sendedDate?.toString(withFormat: Constants().datesFormat).range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
            return condition
        }
        
        chatMessagesTableView.reloadData()
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard entity != nil, context != nil, contact != nil, !contact.phoneNumber!.isEmpty, let message = messageTextField.text, !message.isEmpty
        else {
            ErrorMessages.noMessage.showErrorAlert(viewController: self)
            return
        }
        
        let newMessage = NSManagedObject(entity: entity!, insertInto: context)
        newMessage.setValue(contact.phoneNumber, forKey: "contactPhoneNumber")
        newMessage.setValue(Date(), forKey: "sendedDate")
        newMessage.setValue(message, forKey: "text")
        
        do {
            try context!.save()
            
            let url = "\(Constants().url)\(contact.phoneNumber!)"
            
            if UIApplication.shared.canOpenURL(URL(string: url)!) {
                
                if #available(iOS 10.0, *) {
                    
                    UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: { _ in
                    })
                } else {
                    UIApplication.shared.openURL(URL(string: url)!)
                }
            }
            
            fetchMessages()
            
            chatMessagesTableView.reloadData()
            
            messageTextField.text = ""
        } catch {
            ErrorMessages.errorSaving.showErrorAlert(viewController: self)
        }
    }
}

extension ChatsViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.reuseIdentifier, for: indexPath) as? ContactsTableViewCell else {
            fatalError("Unexpected Index Path = \(indexPath.debugDescription)")
        }
        
        let message = searchdata[indexPath.row]
        
        // Configure Cell
        let text = message.value(forKeyPath: "text") as? String
        let sendedDate = message.value(forKeyPath: "sendedDate") as? Date
        
        cell.cellLabel.text = "\(sendedDate!.toString(withFormat: Constants().datesFormat)) \(text!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let message = searchdata[indexPath.row]
        
        coordinator?.goToMessageDetailView(message: message)
    }
}
