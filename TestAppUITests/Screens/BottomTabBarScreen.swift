//
//  BottomTabViewScreen.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

class BottomTabBarScreen: BaseScreen {
    
    enum Tab {
        case circle
        case square
    }
    
    var tabBar: XCUIElement!
    var circleButton: XCUIElement!
    var squareButton: XCUIElement!
    
    override init() {
        super.init()
    
        tabBar = app.tabBars.element(boundBy: 0)
        circleButton = tabBar.buttons["First"]
        squareButton = tabBar.buttons["Second"]
    
        screenTraits.append(tabBar)
    }
    
    func navigateToTab(tab: Tab) {
        testCase?.waitUntilElementActive(element: tabBar)
        switch tab {
        case .circle:
            circleButton.tap()
        case .square:
            squareButton.tap()
        }
    }

}
