//
//  ContactsViewModelTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 16/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ContactsViewModelTests: XCTestCase {
    
    let contactsViewModel = ContactsViewModel.instantiate()
    
    weak var appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
        
        contactsViewModel.contactsTableView = UITableView()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ChatsViewModel_whenViewDidLoad_shouldNotCrash() throws {
        contactsViewModel.viewDidLoad()
    }
    
    func test_ChatsViewModel_whenAuthenticate_shouldNotCrash() throws {
        contactsViewModel.authenticate()
    }
    
    func test_ChatsViewModel_whenViewDidAppearWithoutAuthenticate_shouldNotCrash() throws {
        contactsViewModel.viewDidAppear(true)
    }
    
    func test_ChatsViewModel_whenViewDidAppearWithAuthenticate_shouldNotCrash() throws {
        
        let tempValue = appDelegate?.userDefaults.bool(forKey: Constants().authenticateUserDefaultNameOnContacts)
        
        appDelegate.userDefaults.set(true, forKey: Constants().authenticateUserDefaultNameOnContacts)
        
        contactsViewModel.viewDidAppear(true)
        
        appDelegate.userDefaults.set(tempValue, forKey: Constants().authenticateUserDefaultNameOnContacts)
    }
    
    func test_ChatsViewModel_whenRefresh_shouldNotCrash() throws {
        contactsViewModel.refresh(nil)
    }
    
    func test_ChatsViewModel_whenSearchBarCancelButtonClicked_shouldNotCrash() throws {
        contactsViewModel.searchBarCancelButtonClicked(UISearchBar())
    }
    
    func test_ChatsViewModel_whenSearchBarTextDidChange_shouldNotCrash() throws {
        contactsViewModel.searchBar(UISearchBar(), textDidChange: "Test")
    }
}
