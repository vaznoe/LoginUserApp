//
//  UserPage.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public struct UserPageContext {
    public var isUserNameDisplayed: Bool
    public var userNameLabel: String
}

public class UserPage: Page, TabBarPage, PageType {
    private let userName: XCUIElement

    public required init(application: XCUIApplication) throws {
        userName = application.navigationBars.staticTexts.firstMatch
    
        try super.init(application: application, ready: .exists(userName))
    }

    public func getContext(_ callback: (UserPageContext)->()) -> UserPage {
        XCTContext.runActivity(named: "Get context") { _ in
            let context = UserPageContext(
                isUserNameDisplayed: userName.exists,
                userNameLabel: userName.label)
            callback(context)
            return self
        }
    }
}
