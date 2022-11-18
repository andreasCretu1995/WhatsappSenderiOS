//
//  MessageDetailViewModelTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 16/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class MessageDetailViewModelTests: XCTestCase {
    
    let messageDetailViewModel = MessageDetailViewModel.instantiate()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_MessageDetailViewModel_whenViewDidLoad_shouldNotCrash() throws {
        messageDetailViewModel.viewDidLoad()
    }
    
    func test_MessageDetailViewModel_whenGoToHistoryView_shouldNotCrash() throws {
        messageDetailViewModel.goToHistoryView()
    }
}
