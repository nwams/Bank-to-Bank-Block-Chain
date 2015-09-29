//
//  BB_Block_ChainUITests.swift
//  BB Block ChainUITests
//
//  Created by Nwamaka Nzeocha on 9/27/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import XCTest

class BB_Block_ChainUITests: XCTestCase {
        
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
        
        let app = XCUIApplication()
        app.buttons["Enroll in Online & Mobile Banking"].tap()
        
        let firstNameTextField = app.textFields["First Name"]
        firstNameTextField.tap()
        firstNameTextField.typeText("Nwamaka")
        
        let lastNameTextField = app.textFields["Last Name"]
        lastNameTextField.tap()
        lastNameTextField.typeText("Nzeocha")
        
        let accountNumberTextField = app.textFields["Account Number"]
        accountNumberTextField.tap()
        accountNumberTextField.typeText("1234")
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("nwams")
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("nwamakanz@yahoo.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("1234")
        
        let repeatPasswordSecureTextField = app.secureTextFields["Repeat Password"]
        repeatPasswordSecureTextField.tap()
        repeatPasswordSecureTextField.typeText("1234")
        app.buttons["Enroll"].tap()
        
        XCTAssert(app.textFields["First Name"].exists)
        XCTAssert(app.textFields["Last Name"].exists)
        XCTAssert(app.textFields["Account Number"].exists)
        XCTAssert(app.textFields["Username"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.secureTextFields["Password"].exists)
        XCTAssert(app.secureTextFields["Repeat Password"].exists)
        
        
    }
    
}
