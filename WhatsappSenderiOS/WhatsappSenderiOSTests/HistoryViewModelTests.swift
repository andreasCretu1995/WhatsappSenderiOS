//
//  HistoryViewModelTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 16/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class HistoryViewModelTests: XCTestCase {
    
    let historyViewModel = HistoryViewModel.instantiate()
    
    weak var appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
        
        historyViewModel.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_HistoryViewModel_whenViewDidLoad_shouldNotCrash() throws {
        historyViewModel.viewDidLoad()
    }
    
    func test_HistoryViewModel_whenAuthenticate_shouldNotCrash() throws {
        historyViewModel.authenticate()
    }
    
    func test_HistoryViewModel_whenViewDidAppearWithoutAuthenticate_shouldNotCrash() throws {
        historyViewModel.viewDidAppear(true)
    }
    
    func test_HistoryViewModel_whenViewDidAppearWithAuthenticate_shouldNotCrash() throws {
        
        let tempValue = appDelegate?.userDefaults.bool(forKey: Constants().authenticateUserDefaultNameOnContacts)
        
        appDelegate.userDefaults.set(true, forKey: Constants().authenticateUserDefaultNameOnContacts)
        
        historyViewModel.viewDidAppear(true)
        
        appDelegate.userDefaults.set(tempValue, forKey: Constants().authenticateUserDefaultNameOnContacts)
    }
    
    func test_HistoryViewModel_whenRefresh_shouldNotCrash() throws {
        historyViewModel.refresh(nil)
    }
    
    func test_ChatsViewModel_whenFetchMessages_shouldNotCrash() throws {
        historyViewModel.fetchMessages()
    }
    
    func test_HistoryViewModel_whenSearchBarCancelButtonClicked_shouldNotCrash() throws {
        historyViewModel.searchBarCancelButtonClicked(UISearchBar())
    }
    
    func test_HistoryViewModel_whenSearchBarTextDidChange_shouldNotCrash() throws {
        historyViewModel.searchBar(UISearchBar(), textDidChange: "Test")
    }
}
