//
//  MainCoordinatorTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

import CoreData
@testable import WhatsappSenderiOS
import XCTest

final class MainCoordinatorTests: XCTestCase {
    
    weak var appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
    
    let coordinator = MainCoordinator(navigationController: UINavigationController())
    
    var context: NSManagedObjectContext?
    
    var entity: NSEntityDescription?
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Messages")
    
    var message: NSManagedObject?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_MainCoordinator_whenInitialize_shouldNotCrash() throws {
        
        XCTAssertNotNil(MainCoordinator(navigationController: nil))
        
        XCTAssertNotNil(coordinator)
    }
    
    func test_MainCoordinator_whenGoToChatView_shouldGoToChatsView() throws {
        
        try test_MainCoordinator_whenInitialize_shouldNotCrash()
        
        coordinator.goToChatView(contact: ContactModel(identifier: "", givenName: "", familyName: "", phoneNumber: ""))
    }
    
    func test_MainCoordinator_whenGoToRootView_shouldGoBackToRootView() throws {
        
        try test_MainCoordinator_whenInitialize_shouldNotCrash()
        
        coordinator.goToRootView()
    }
    
    func test_MainCoordinator_whenGoToMessageDetailView_shouldGoToMessagesDetailView() throws {
        
        try test_MainCoordinator_whenInitialize_shouldNotCrash()
        
        context = appDelegate!.persistentContainer.viewContext
        
        entity = NSEntityDescription.entity(forEntityName: "Messages", in: context!)!
        
        fetchMessages()
        
        coordinator.goToMessageDetailView(message: message!)
    }
    
    func test_MainCoordinator_whenGoToHistoryView_shouldGoToHistoryView() throws {
        
        try test_MainCoordinator_whenInitialize_shouldNotCrash()
        
        coordinator.goToHistoryView()
    }
}

extension MainCoordinatorTests {
    
    func fetchMessages() {
        
        do {
            message = try context!.fetch(fetchRequest).first
        } catch let error as NSError {
            print("error \(error.localizedDescription)")
        }
    }
}
