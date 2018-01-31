# xcuitest-framework-for-testing-ios
An example of how you could potentially implement Page Objects when testing iOS apps using XCTest / XCUITest in Swift

The project was written using Swift v4 and XCode 9.2

Simply open up the 'TestApp' project and build.
Then navigate to the 'BasicTests.swift' file to see an example test that implements the framework.

I have also added a little helper method to check when an element is in the 'selected' state.

The key concepts are the following;

## Feature.swift (Found in... TestAppUITests > Feature > Feature.swift)
This file essentually handles the App state (including setup and teardown).
This file is where you are required to explicitly add your screen objects (swift files) so that they can be
loaded and referenced when writing your test functions.

## App.swift (Found in... TestAppUITests > Library > Helpers > App.swift) 
This file is the singleton in charge of creating XCUIApplication instance and managing the global app state.
This is created so the same application instance can be used accross different pages of the app
and the instance we are calling is the one that got launched.

## SinfoniQATestCase.swift (Found in... TestAppUITests > Library > SinfoniQA > SinfoniQATestCase.swift)
This file acts as a sort of parent class, where the files are able to access other methods. 
You could actually get away with not having this and putting this capability elsewhere.

The file also includes a method that allows you to check the 'selected' state of an element. Particularly useful
when wanting to check if a button/switch is in the state you want it to be in.

## BaseScreen.swift (Found in... TestAppUITests > Screens > BaseScreen.swift)
This is essentially the blueprint for what all the other screens/pages will be modelled on.
It contains a component that will allow for a 'trait' to be defined for each screen/page which adds a
pre-condition/check to ensure you're on the screen/page that you think you're on, i.e....
```
firstViewControllerScreen.isScreenShown()
```

There is an initialiser that initialises the 'test' so that the screen/page can be initialised, i.e. allowing you to do...
```
bottomTabBar.navigateToTab(tab: .circle)
```

## Example of a screen object...
```
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
```
Notes:
 - Inherit from BaseScreen
 - Define a variable for each element, force unwrapping it, since we know we will have a value for it...
 - Specify the element itself
 - Explicitly set a trait for this specific screen.


## Example of what a test looks like...
```
import XCTest

class BasicTests: Feature {
    
    func testBottomTabBar() {
	XCTAssertTrue(bottomTabBar.tabBar.buttons.count == 2)
	bottomTabBar.navigateToTab(tab: .circle)
	XCTAssertTrue(secondViewControllerScreen.subTitle.label == "something")
    }
}
```
	 

  
