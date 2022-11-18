//
//  Date+ExtTests.swift
//  WhatsappSenderiOSTests
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

@testable import WhatsappSenderiOS
import XCTest

final class DateExtTests: XCTestCase {
    
    var dateComponents = DateComponents()
    
    var auxDateComponents = DateComponents()

    let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
    
    var someDate: Date? = Date()
    
    var someDateTime: Date? = Date()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
        
        // Specify date components
        dateComponents.year = 2022
        dateComponents.month = 14
        dateComponents.day = 32
        dateComponents.hour = 25
        dateComponents.minute = 60
        dateComponents.second = 60
        
        someDateTime = userCalendar.date(from: dateComponents)
        
        auxDateComponents.year = 2022
        auxDateComponents.month = 14
        auxDateComponents.day = 32
        
        someDate = userCalendar.date(from: auxDateComponents)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_DateExtTests_whenInitWithBadDateWithoutTime_shouldReturnTrue() throws {
        
        let date = Date.with(year: 2022, month: 14, day: 32)
        
        XCTAssertNotNil(date)
        
        XCTAssertEqual(date, someDate)
    }
    
    func test_DateExtTests_whenInitWithBadDateWithTime_shouldReturnTrue() throws {
        
        let date = Date.with(year: 2022, month: 14, day: 32, hour: 25, minute: 60, second: 60)
        
        XCTAssertNotNil(date)
        
        XCTAssertEqual(date, someDateTime)
    }
    
    func test_DateExtTests_whenTranslateToLocalizedStringWithoutTime_shouldReturnTrue() throws {
    
        XCTAssertEqual(someDate?.toLocalizedString(withTime: false, toLocale: "de"), "04.03.23")
    }
    
    func test_DateExtTests_whenTranslateToLocalizedStringWithTime_shouldReturnTrue() throws {
        
        XCTAssertEqual(someDateTime?.toLocalizedString(withTime: true, toLocale: "de"), "05.03.23, 02:01:00")
    }
    
    func test_DateExtTests_whenTranslateToString_shouldReturnTrue() throws {
        
        XCTAssertEqual(someDateTime?.toString(withFormat: "dd-MM-yyyy HH:mm:ss"), "05-03-2023 02:01:00")
    }
}
