//
//  WhatsappSenderiOSUITests.swift
//  WhatsappSenderiOSUITests
//
//  Created by Andreas Alexandru Cretu on 10/11/22.
//

import XCTest

final class WhatsappSenderiOSUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        app.launchArguments = ["isRunningTest"]
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let buscarSearchField = app.searchFields["Buscar"]
        buscarSearchField.tap()
        buscarSearchField.clearAndEnterText(text: "Andreas")
        
        let cancelarStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Cancelar"]/*[[".buttons[\"Cancelar\"].staticTexts[\"Cancelar\"]",".staticTexts[\"Cancelar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cancelarStaticText.tap()
        
        let tablesQuery2 = app.tables
        let introducirNMeroStaticText = tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Introducir número  "]/*[[".cells.staticTexts[\"Introducir número  \"]",".staticTexts[\"Introducir número  \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        introducirNMeroStaticText.tap()
        
        let elementsQuery = app.alerts["Introducir número"].scrollViews.otherElements
        let collectionViewsQuery = elementsQuery.collectionViews
        let countryPrefixTextfield = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Introducir prefijo del país"]/*[[".cells.textFields[\"Introducir prefijo del país\"]",".textFields[\"Introducir prefijo del país\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        countryPrefixTextfield.tap()
        elementsQuery.buttons["Cancel"].tap()
        introducirNMeroStaticText.tap()
        
        let okButton = elementsQuery.buttons["OK"]
        okButton.tap()
        app.alerts["ERROR"].scrollViews.otherElements.buttons["OK"].tap()
        introducirNMeroStaticText.tap()
        let phoneNumberTextfield = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Introducir número"]/*[[".cells.textFields[\"Introducir número\"]",".textFields[\"Introducir número\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        phoneNumberTextfield.tap()
        okButton.tap()
        buscarSearchField.tap()
        cancelarStaticText.tap()
        
        let mensajeTextField = app.textFields["Mensaje"]
        mensajeTextField.tap()
        mensajeTextField.tap()
        app.buttons["enviar"].tap()
        mensajeTextField.tap()
        
        app/*@START_MENU_TOKEN@*/.otherElements["card:com.andreasCretu1995.WhatsappSenderiOS:sceneID:com.andreasCretu1995.WhatsappSenderiOS-default"]/*[[".windows[\"SBSwitcherWindow:Main\"]",".otherElements[\"AppSwitcherContentView\"]",".otherElements[\"WhatsappSenderiOS\"]",".otherElements[\"card:com.andreasCretu1995.WhatsappSenderiOS:sceneID:com.andreasCretu1995.WhatsappSenderiOS-default\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.scrollViews.otherElements.statusBars.staticTexts["11:29"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["17-11-2022 11:29:24 Hola"]/*[[".cells.staticTexts[\"17-11-2022 11:29:24 Hola\"]",".staticTexts[\"17-11-2022 11:29:24 Hola\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["17-11-2022 11:29:24 34637208675"].buttons[" Atrás"].tap()
        tablesQuery2.children(matching: .cell).element(boundBy: 1).staticTexts["Andreas Cretu 34666666666"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["14-11-2022 15:16:25 Mensaje a Andy a las 15:16"]/*[[".cells.staticTexts[\"14-11-2022 15:16:25 Mensaje a Andy a las 15:16\"]",".staticTexts[\"14-11-2022 15:16:25 Mensaje a Andy a las 15:16\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["14-11-2022 15:16:25 Andreas Cretu"].buttons[" Atrás"].tap()
        app.tabBars["Barra de pestañas"].buttons["Historia"].tap()
        buscarSearchField.tap()
        cancelarStaticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["14-11-2022 19:41:58 Andreas Cretu Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.   Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."]/*[[".cells.staticTexts[\"14-11-2022 19:41:58 Andreas Cretu Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.   Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\"]",".staticTexts[\"14-11-2022 19:41:58 Andreas Cretu Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.   Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["14-11-2022 19:41:58 Andreas Cretu"].buttons[" Atrás"].tap()
    }

    func testLaunchPerformance() throws {
       // This measures how long it takes to launch your application.
        if #available(iOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }
}

extension WhatsappSenderiOSUITests {
    
    func showAlert(withDescription: String?, tapOKButton: Bool? = true) {
        
        addUIInterruptionMonitor(withDescription: withDescription ?? "Permission Dialog") { alert -> Bool in
            
            if tapOKButton! {
                alert.buttons["OK"].tap()
            }
            
            return true
        }
    }
    
    func showConfirm(withDescription: String?, tapOKButton: Bool? = false, tapCancelButton: Bool? = true) {
        
        addUIInterruptionMonitor(withDescription: withDescription ?? "Permission Dialog") { alert -> Bool in
            
            if tapOKButton! {
                alert.buttons["OK"].tap()
            } else if tapCancelButton! {
                alert.buttons["Cancel"].tap()
            }
            
            return true
        }
    }
}

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        
        self.typeText(deleteString)
        self.typeText(text)
    }
}
