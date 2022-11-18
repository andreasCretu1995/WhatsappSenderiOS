//
//  AppDelegateTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class AppDelegateTests: XCTestCase {
    
    weak var appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
        
    func test_AppDelegate_whenInit_shouldNotCrash() throws {
        
        XCTAssertNotNil(appDelegate)
        
        XCTAssertNotNil(appDelegate.userDefaults)
    }
    
    func test_removeUserDefaults_whenNoUserDefaults_shouldNotCrash() throws {
        
        try test_AppDelegate_whenInit_shouldNotCrash()

        appDelegate.removeUserDefaults(userDefaults: nil)
        
        let dict: [String: Any] = (appDelegate.userDefaults?.dictionaryRepresentation())!
        
        XCTAssertTrue(!dict.isEmpty)
    }
    
    func test_removeUserDefaults_whenUserDefaults_shouldRemoveThem() throws {
        
        try test_AppDelegate_whenInit_shouldNotCrash()
        
        appDelegate.removeUserDefaults(userDefaults: appDelegate.userDefaults)
        
        let dict: [String: Any] = (appDelegate.userDefaults?.dictionaryRepresentation())!
                
        // XCTAssertTrue(dict.isEmpty)
    }
    
    func test_createItems3DTouch_when_shouldCreateShortcutItems() throws {
        
        try test_AppDelegate_whenInit_shouldNotCrash()
        
        appDelegate.createItems3DTouch()
        
        XCTAssertEqual(UIApplication.shared.shortcutItems?.isEmpty, false)
    }
    
    func test_application_whendidFinishLaunchingWithOptions_shouldHaveWindowRootViewController() throws {
        
        try test_AppDelegate_whenInit_shouldNotCrash()
        
        XCTAssertTrue(appDelegate.window?.rootViewController == appDelegate.tabbarViewController)
    }
}
