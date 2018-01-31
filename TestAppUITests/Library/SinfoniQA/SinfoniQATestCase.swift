//
//  SinfoniQATestCase.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

open class SinfoniQATestCase: XCTestCase {
    
    func waitUntilElementActive(element: XCUIElement, timeout: TimeInterval = 5) {
        let exists = NSPredicate(format: "exists == true AND hittable == true")
        self.expectation(for: exists, evaluatedWith: element, handler: nil)
        self.waitForExpectations(timeout: timeout, handler: nil)
        XCTAssert(element.exists)
    }
    
    func assertElementSelected(element: XCUIElement) {
        let selected = NSPredicate(format: "selected == true")
        self.expectation(for: selected, evaluatedWith: element, handler: nil)
        self.waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(element.isSelected)

    }

}
