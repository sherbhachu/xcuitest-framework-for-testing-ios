//
//  BasicTests.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

class BasicTests: Feature {
    
    func testBasic() {
        
        let subtitleText = "Loaded by SecondViewController"
            
        firstViewControllerScreen.isScreenShown()
        assertElementSelected(element: bottomTabBar.circleButton)
        XCTAssertTrue(bottomTabBar.tabBar.buttons.count == 2)
        bottomTabBar.navigateToTab(tab: .square)
        secondViewControllerScreen.isScreenShown()
        XCTAssertTrue(secondViewControllerScreen.subTitle.label == subtitleText)
        bottomTabBar.navigateToTab(tab: .circle)
        XCTAssertTrue(firstViewControllerScreen.subTitle.label != subtitleText)
        
    }
}
