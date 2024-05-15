//
//  TabBarPage.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public protocol TabBarPage {}

public extension TabBarPage where Self: PageType {
    
    func navigateToHome() throws -> WelcomePage {
        try tapTabBarButton(WelcomePage.self, index: 0)
    }
    
    func navigateToUser() throws -> UserPage {
        try tapTabBarButton(UserPage.self, index: 1)
    }
    
    private func tapTabBarButton<T: PageType>(_ type: T.Type, index: Int) throws -> T {
        try XCTContext.runActivity(named: "Tab TabBar button") { _ in
            let tabBarButton: XCUIElement = app.tabBars.buttons.element(boundBy: index).firstMatch
            
            if tabBarButton.exists {
                tabBarButton.tap()
            } else {
                XCTFail("The element does not exists")
            }
            
            return try T(application: app)
        }
    }
}
