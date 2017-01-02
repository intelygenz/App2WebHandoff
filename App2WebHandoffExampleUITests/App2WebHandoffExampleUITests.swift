//
//  App2WebHandoffExampleUITests.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import XCTest

class App2WebHandoffExampleUITests: XCTestCase {

    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app = XCUIApplication()
        app.launch()
    }
    
    func testUIHandoffWebView() {
        app.buttons["UIHandoffWebView"].tap()
        sleep(5)
        app.buttons["Done"].tap()
    }

    func testWKHandoffWebView() {
        app.buttons["WKHandoffWebView"].tap()
        sleep(5)
        app.buttons["Done"].tap()
    }

    func testSFHandoffSafariViewController() {
        app.buttons["SFHandoffSafariViewController"].tap()
        sleep(5)
        app.buttons["Done"].tap()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

}
