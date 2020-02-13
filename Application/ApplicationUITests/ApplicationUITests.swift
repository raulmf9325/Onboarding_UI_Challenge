//
//  ApplicationUITests.swift
//  ApplicationUITests
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import XCTest

class ApplicationUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

     func testExistenceOfCreateAccountLabel() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let skipButton = app.buttons["SKIP"]
        skipButton.tap()
        
        let backButton = app.buttons.element(boundBy: 0)
        backButton.tap()
        
        let firstLabel = app.staticTexts["Create an account"]
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: firstLabel, handler: nil)
        waitForExpectations(timeout: 2.0, handler: nil)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
