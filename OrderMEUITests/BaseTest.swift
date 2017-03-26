//
//  BaseTest.swift
//  orderMe
//
//  Created by Boris Gurtovyy on 3/26/17.
//  Copyright © 2017 Boris Gurtovoy. All rights reserved.
//

import Foundation
import XCTest

class BaseTest : XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func waitForElementToAppear(format: String, element: AnyObject, time: Double){
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: time, handler: nil)
    }
    
    func handleLocation() {
     addUIInterruptionMonitor(withDescription: "Allow Location") { (alert) -> Bool in
        alert.buttons["Allow"].tap()
        return true
        }
     XCUIApplication().tap()
    }
    
    
}
