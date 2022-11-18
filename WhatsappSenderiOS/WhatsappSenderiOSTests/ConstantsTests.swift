//
//  ConstantsTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ConstantsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_constants_whenInitialize_shouldNotCrash() throws {
        
        XCTAssertNotNil(Constants())
        
        XCTAssertTrue(!Constants().userDefaultsSuitName.isEmpty)
        XCTAssertTrue(!Constants().UIStoryboardName.isEmpty)
        XCTAssertTrue(!Constants().NSPersistentContainerName.isEmpty)
        XCTAssertTrue(!Constants().reuseIdentifier.isEmpty)
        XCTAssertTrue(!Constants().url.isEmpty)
        XCTAssertTrue(!Constants().messagesEntity.isEmpty)
        XCTAssertTrue(!Constants().authenticateUserDefaultNameOnContacts.isEmpty)
        XCTAssertTrue(!Constants().authenticateUserDefaultNameOnHistory.isEmpty)
        XCTAssertTrue(!Constants().datesFormat.isEmpty)
        XCTAssertTrue(!Constants().contactsViewQuickAccessType.isEmpty)
        XCTAssertTrue(!Constants().historyViewQuickAccessType.isEmpty)
    }
}
