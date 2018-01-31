//
//  App.swift
//  TestAppUITests
//
//  Created by Sher Bhachu on 31/01/2018.
//  Copyright © 2018 SinfoniQA. All rights reserved.
//

import Foundation
import XCTest

/**
 Singleton in charge of creating XCUIApplication instance and managing the global app state,
 This is created so the same application instance can be used accross different pages of the app
 and the instance we are calling is the one that got launched.
 */

final class App {
    
    //Any app logic, i.e. terminate, etc
    //Any logic to handle things like GPS, Language, Environment setup can be initiated here.

    static let shared = App()
    
    private var currentApp: XCUIApplication?
    
    private init () {}
    
    func terminate() {
        currentApp?.terminate()
        currentApp = nil
    }
    
    func current() -> XCUIApplication {
        if let app =  currentApp {
            return app
        }
        let app = XCUIApplication()
        currentApp = app
        return app
    }
    
}


