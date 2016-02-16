
let app = XCUIApplication()
app.childrenMatchingType(.Window).elementBoundByIndex(3).childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(1).tap()
app.scrollViews.otherElements.icons["ZooKeeper"].pressForDuration(1.7);
// Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app

let masterButton = app.navigationBars["Master"].buttons["Master"]
masterButton.tap()

let tablesQuery = app.tables
tablesQuery.staticTexts["Donald"].tap()
masterButton.tap()
tablesQuery.staticTexts["I'm a girl brown Charlie animal"].tap()
app.datePickers.pickerWheels["2016"].tap()

let animalWeightLbsTextField = app.textFields["Animal Weight lbs"]
animalWeightLbsTextField.tap()
animalWeightLbsTextField.typeText("34\r")

let animalColorTextField = app.textFields["Animal color"]
animalColorTextField.tap()
animalColorTextField.tap()
masterButton.tap()
// Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
masterButton.tap()
tablesQuery.staticTexts["Lion-o"].tap()
masterButton.tap()
//
//  ZooKeeperUITests.swift
//  ZooKeeperUITests
//
//  Created by Wayne Bangert on 2/4/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import XCTest

class ZooKeeperUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
