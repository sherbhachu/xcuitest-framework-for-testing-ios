//
//  SecondViewScreen.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

class SecondViewScreen: BaseScreen {
    
    var title: XCUIElement!
    var subTitle: XCUIElement!
    
    override init() {
        super.init()
        
        title = app.staticTexts["Second View"]
        subTitle = app.staticTexts.element(boundBy: 1)
        
        screenTraits.append(title)
    }
}
