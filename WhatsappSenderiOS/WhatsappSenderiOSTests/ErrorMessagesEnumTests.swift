//
//  ErrorMessagesEnumTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ErrorMessagesEnumTests: XCTestCase {
    
    weak var appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ErrorMEssages_whenInitialize_shouldNotCrash() throws {
        
        XCTAssertNotNil(ErrorMessages(rawValue: 1))
    }
    
    func test_ErrorMEssages_whenLocalizedString_shouldReturnLocalizedString() throws {
        
        try test_ErrorMEssages_whenInitialize_shouldNotCrash()
        
        XCTAssertNotNil(ErrorMessages(rawValue: 1)?.localizedString)
        XCTAssertEqual(ErrorMessages(rawValue: 1)?.localizedString, NSLocalizedString("error_noPhoneNumber", comment: ""))
        
        XCTAssertNotNil(ErrorMessages(rawValue: 2)?.localizedString)
        XCTAssertEqual(ErrorMessages(rawValue: 2)?.localizedString, NSLocalizedString("error_noMessage", comment: ""))
        
        XCTAssertNotNil(ErrorMessages(rawValue: 3)?.localizedString)
        XCTAssertEqual(ErrorMessages(rawValue: 3)?.localizedString, NSLocalizedString("error_couldNotFetch", comment: ""))
        
        XCTAssertNotNil(ErrorMessages(rawValue: 4)?.localizedString)
        XCTAssertEqual(ErrorMessages(rawValue: 4)?.localizedString, NSLocalizedString("error_errorSaving", comment: ""))
    }
    
    func test_ErrorMEssages_whenshowErrorAlert_shouldShowAlert() throws {
        
        try test_ErrorMEssages_whenInitialize_shouldNotCrash()
        
        ErrorMessages(rawValue: 1)?.showErrorAlert(viewController: (appDelegate.window?.rootViewController)!)
    }
}
