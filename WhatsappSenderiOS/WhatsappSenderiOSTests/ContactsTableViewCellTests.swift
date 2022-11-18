//
//  ContactsTableViewCellTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 16/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ContactsTableViewCellTests: XCTestCase {
    
    let contactsTableViewCell = ContactsTableViewCell()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ContactsTableViewCell_whenInit_shouldReturnTrue() throws {
        
        XCTAssertNotNil(contactsTableViewCell)
        
        XCTAssertEqual(ContactsTableViewCell.cellReuseIdentifier, Constants().reuseIdentifier)
    }
    
    func test_ContactsTableViewCell_whenAwakeFromNib_shouldReturnTrue() throws {
        
        try test_ContactsTableViewCell_whenInit_shouldReturnTrue()
        
        contactsTableViewCell.awakeFromNib()
    }
}
