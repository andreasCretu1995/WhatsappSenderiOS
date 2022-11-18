//
//  ContactModelTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ContactModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ContactModel_whenInitWithoutParams_shouldReturnTrue() throws {
        
        let contact = ContactModel()
        
        XCTAssertNotNil(contact)
        
        XCTAssertTrue(contact.identifier!.isEmpty)
        XCTAssertTrue(contact.givenName!.isEmpty)
        XCTAssertTrue(contact.familyName!.isEmpty)
        XCTAssertTrue(contact.phoneNumber!.isEmpty)
    }
    
    func test_ContactModel_whenInitWithParams_shouldReturnTrue() throws {
        
        let contact = ContactModel(identifier: "identifier", givenName: "givenName", familyName: "familyName", phoneNumber: "34666666666")
        
        XCTAssertNotNil(contact)
        
        XCTAssertTrue(!contact.identifier!.isEmpty)
        XCTAssertEqual(contact.identifier, "identifier")
        
        XCTAssertTrue(!contact.givenName!.isEmpty)
        XCTAssertEqual(contact.givenName, "givenName")
        
        XCTAssertTrue(!contact.familyName!.isEmpty)
        XCTAssertEqual(contact.familyName, "familyName")
        
        XCTAssertTrue(!contact.phoneNumber!.isEmpty)
        XCTAssertEqual(contact.phoneNumber, "34666666666")
    }
    
    func test_ContactModel_whenGetCountryPhonceCodeBad_shouldReturnTrue() throws {
        
        XCTAssertNotNil(ContactModel.getCountryPhonceCode("ABC"))
        XCTAssertEqual(ContactModel.getCountryPhonceCode("ABC"), "")
    }
    
    func test_ContactModel_whenGetCountryPhonceCodeGood_shouldReturnTrue() throws {
        
        XCTAssertNotNil(ContactModel.getCountryPhonceCode("ES"))
        XCTAssertEqual(ContactModel.getCountryPhonceCode("ES"), "34")
    }
}
