//
//  FirstViewScreen.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import XCTest

class FirstViewScreen: BaseScreen {

    var title: XCUIElement!
    var subTitle: XCUIElement!

    override init() {
    super.init()
    
    title = app.staticTexts["First View"]
    subTitle = app.staticTexts["Loaded by FirstViewController"]
    
    screenTraits.append(title)
    }
}
