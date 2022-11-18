//
//  Array+ExtTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class ArrayExtTests: XCTestCase {
    
    let numbersWithoutDuplicates = [1, 2, 3, 4, 5]
    let numbersWithDuplicates = [1, 2, 3, 4, 5, 5]
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ArrayExtTests_whenHasDuplicates_shouldReturnFalse() throws {

        XCTAssertFalse(numbersWithoutDuplicates.hasDuplicates())
    }
    
    func test_ArrayExtTests_whenHasDuplicates_shouldReturnTrue() throws {
        
        XCTAssertTrue(numbersWithDuplicates.hasDuplicates())
    }
    
    func test_ArrayExtTests_whenRemoveDuplicatesWithoutDuplicates_shouldReturnTheSameArray() throws {
    
        let auxNumbers = numbersWithoutDuplicates.removeDuplicates()
        
        XCTAssertEqual(numbersWithoutDuplicates, auxNumbers)
    }
    
    func test_ArrayExtTests_whenRemoveDuplicatesWithDuplicates_shouldReturnDifferentArray() throws {
        
        let auxNumbers = numbersWithDuplicates.removeDuplicates()
        
        XCTAssertNotEqual(numbersWithDuplicates, auxNumbers)
    }
}
