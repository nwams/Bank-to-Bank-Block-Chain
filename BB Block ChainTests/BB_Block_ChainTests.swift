//
//  BB_Block_ChainTests.swift
//  BB Block ChainTests
//
//  Created by Nwamaka Nzeocha on 9/27/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import XCTest

@testable import BB_Block_Chain

class BB_Block_ChainTests: XCTestCase {
    var bbblock: LoginViewController!
    
    override func setUp() {
        super.setUp()
        
        self.bbblock = LoginViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCheck_returnsNumber() {
        XCTAssertEqual(self.bbblock.check(11), "11")
    }
    
}