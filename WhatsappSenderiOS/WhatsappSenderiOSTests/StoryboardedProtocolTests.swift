//
//  StoryboardedProtocolTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class StoryboardedProtocolTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_StoryboardedProtocol_whenInit_shouldReturnTrue() throws {
        
        XCTAssertNotNil(ContactsViewModel.instantiate())
    }
}
