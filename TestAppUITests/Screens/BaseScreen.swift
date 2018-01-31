//
//  BaseScreen.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

open class BaseScreen: NSObject {
    
    internal let app: XCUIApplication
    internal var testCase: SinfoniQATestCase?
    internal var screenTraits: [XCUIElement]
    
    override init() {
        app = App.shared.current()
        screenTraits = []
        super.init()
    }
    
    convenience init(testCase inTestCase: SinfoniQATestCase) {
        self.init()
        testCase = inTestCase
    }
    
    //Userful method to check for a specific element, so that we know we are on that screen.
    func isScreenShown(timeout: TimeInterval = 10) {
        guard screenTraits.count > 0 else {
            return
        }
        if let element = screenTraits.first {
            testCase?.waitUntilElementActive(element: element, timeout: timeout)
        }
    }

}
