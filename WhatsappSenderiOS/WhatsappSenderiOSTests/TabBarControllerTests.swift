//
//  TabBarControllerViewModelTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 16/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class TabBarControllerViewModelTests: XCTestCase {
    
    let tabBarControllerViewModel = TabBarViewModel.instantiate()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_TabBarControllerViewModel_whenShowViewIndexOutOfRange_shouldNotCrash() throws {
        
        XCTAssertNotNil(tabBarControllerViewModel)
        
        tabBarControllerViewModel.showView(index: -1)
        
        tabBarControllerViewModel.showView(index: tabBarControllerViewModel.viewControllers!.count + 1)
    }
    
    func test_TabBarControllerViewModel_whenShowView_shouldNotCrash() throws {
        
        tabBarControllerViewModel.showView(index: 0)

        XCTAssertTrue((tabBarControllerViewModel.selectedViewController as? UINavigationController)?.viewControllers[0] is ContactsViewModel, "tabBarViewController 0 is not ContactsViewModel")
        
        tabBarControllerViewModel.showView(index: 1)
        
        XCTAssertTrue((tabBarControllerViewModel.selectedViewController as? UINavigationController)?.viewControllers[0] is HistoryViewModel, "tabBarViewController 1 is not HistoryViewModel")
    }
}
