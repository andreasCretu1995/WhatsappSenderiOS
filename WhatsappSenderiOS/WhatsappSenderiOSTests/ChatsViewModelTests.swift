//
//  ChatsViewModelTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 16/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ChatsViewModelTests: XCTestCase {
    
    let chatsViewModel = ChatsViewModel.instantiate()
    
    weak var appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
                
        chatsViewModel.contact = ContactModel(phoneNumber: "34666666666")
        
        chatsViewModel.chatMessagesTableView = UITableView()

        // chatsViewModel.loadViewIfNeeded()

        chatsViewModel.messageTextField = UITextField()
        
        // chatsViewModel.messageTextField.text = "Test"
        
        chatsViewModel.context = appDelegate!.persistentContainer.viewContext
            
        chatsViewModel.searchBar = UISearchBar()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ChatsViewModel_whenViewDidLoad_shouldNotCrash() throws {
        chatsViewModel.viewDidLoad()
    }
    
    func test_ChatsViewModel_whenRefresh_shouldNotCrash() throws {
        chatsViewModel.refresh(nil)
    }
    
    func test_ChatsViewModel_whenFetchMessages_shouldNotCrash() throws {
        chatsViewModel.fetchMessages()
    }
    
    func test_ChatsViewModel_whenGoToRootView_shouldNotCrash() throws {
        chatsViewModel.goToRootView()
    }
    
    func test_ChatsViewModel_whenSearchBarCancelButtonClicked_shouldNotCrash() throws {
        chatsViewModel.searchBarCancelButtonClicked(UISearchBar())
    }
    
    func test_ChatsViewModel_whenSearchBarTextDidChange_shouldNotCrash() throws {
        chatsViewModel.searchBar(UISearchBar(), textDidChange: "Test")
    }
    
    func test_ChatsViewModel_whenSendMessage_shouldNotCrash() throws {
        chatsViewModel.sendMessage(nil)
    }
}
