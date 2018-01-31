//
//  Feature.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

open class Feature: SinfoniQATestCase {
    
    //Add your screens here...
    var firstViewControllerScreen: FirstViewScreen!
    var secondViewControllerScreen: SecondViewScreen!
    var bottomTabBar: BottomTabBarScreen!

    //Allows access to the 'app' scope
    var app: XCUIApplication {
        return App.shared.current()
    }

    //These methods are created by default when you setup UIAutomation
    open override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.activate()

        //These are needed so that you have access to the elements on the screens within the test methods
        //i.e. testBasicStuff()
        
        firstViewControllerScreen = FirstViewScreen(testCase: self)
        secondViewControllerScreen = SecondViewScreen(testCase: self)
        bottomTabBar = BottomTabBarScreen(testCase: self)

    }

    open override func tearDown() {
        super.tearDown()
    }
}
