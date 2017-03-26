//
//  OrderMEUITests.swift
//  OrderMEUITests
//
//  Created by Boris Gurtovyy on 3/26/17.
//  Copyright © 2017 Boris Gurtovoy. All rights reserved.
//

import XCTest

class OrderMEUITests: BaseTest {
        
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    override func handleLocation() {
        super.handleLocation()
    }
    
    func testCallWaiterForMenu() {
    
        let app = XCUIApplication()
        app.buttons["Log in later"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["The Burger"].tap()
        tablesQuery.staticTexts["Detect table"].tap()
        
        let tableNumberTextfieldTextField = app.textFields["@table_number_textfield"]
        tableNumberTextfieldTextField.tap()
        tableNumberTextfieldTextField.tap()
        tableNumberTextfieldTextField.typeText("3")
        app.buttons["Select table"].tap()
        tablesQuery.staticTexts["Call a waiter"].tap()
        app.alerts["The waiter is on his way"].buttons["Bring a menu"].tap()
        
        let gotItAlert = app.alerts["Got it!"]
        waitForElementToAppear(format: "exists == true", element: gotItAlert, time: 10)
        XCTAssert(gotItAlert.staticTexts["The waiter is on his way"].exists)
        
    }
    
    
}
