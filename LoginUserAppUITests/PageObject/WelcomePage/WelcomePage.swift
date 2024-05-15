//
//  WelcomePage.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public struct WelcomePageContext {
    public var isWelcomeTitleDisplayed: Bool
    public let isLogOutButtonDisplayed: Bool
}

public class WelcomePage: Page, TabBarPage, PageType {
    private let welcomeTitleText: XCUIElement
    private let logOutButton: XCUIElement
    
    public required init(application: XCUIApplication) throws {
        welcomeTitleText = application.staticTexts[AccessibilityIDs.Welcome.welcomeTitleAccessibilityIdText]
        logOutButton = application.buttons[AccessibilityIDs.Welcome.logOutAccessibilityIdButton]
        try super.init(application: application, ready: .exists(welcomeTitleText))
    }
    
    public func logOut() throws -> LoginPage {
        return try XCTContext.runActivity(named: "LogOut") { _ in
            logOutButton.waitForExistence()
            logOutButton.tap()
            return try LoginPage(application: app)
        }
    }
    
    public func getContext(_ callback: (WelcomePageContext)->()) -> WelcomePage {
        XCTContext.runActivity(named: "Get context") { _ in
            let context = WelcomePageContext(
                isWelcomeTitleDisplayed: welcomeTitleText.exists,
                isLogOutButtonDisplayed: logOutButton.exists)
            callback(context)
            return self
        }
    }
}
