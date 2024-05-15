//
//  LoginPage.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public enum LoginPageError: Error {
    case loginUnavailable
}

public struct LoginContext {
    public let isUserNameTextFieldDisplayed: Bool
    public let isPasswordTextFieldDisplayed: Bool
    public var isLogInButtonDisplayed: Bool
    public var buttonLabel: String
    public var isFogotUserNameLinkDisplayed: Bool
    public var isFogotPasswordLinkDisplayed: Bool
}

public class LoginPage: Page {
    private let userNameTextField: XCUIElement
    private let passwordTextField: XCUIElement
    private let logInButton: XCUIElement
    private let fogotUserNameLink: XCUIElement
    private let fogotPasswordLink: XCUIElement
    
    public required init(application: XCUIApplication) throws {
        userNameTextField = application.textFields[AccessibilityIDs.Login.userNameAccessibilityIdTextField]
        passwordTextField = application.secureTextFields[AccessibilityIDs.Login.passwordAccessibilityIdTextField]
        logInButton = application.buttons[AccessibilityIDs.Login.logInAccessibilityIdButton]
        fogotUserNameLink = application.buttons[AccessibilityIDs.Login.fogotUserNameAccessibilityIdLink]
        fogotPasswordLink = application.buttons[AccessibilityIDs.Login.fogotPasswordAccessibilityIdLink]
        try super.init(application: application, ready: .exists(logInButton))
    }
    
    public func enterUserName(_ userName: String) -> Self {
        return XCTContext.runActivity(named: "Enter userName \(userName)") { _ in
            userNameTextField.tapAndWaitForKeyboard()
            userNameTextField.typeText(userName)
            return self
        }
    }
    
    public func enterPassword(_ password: String) -> Self {
        return XCTContext.runActivity(named: "Enter password \(password)") { _ in
            passwordTextField.tapAndWaitForKeyboard()
            passwordTextField.typeText(password)
            return self
        }
    }
    
    public func tapLogIn() {
        XCTContext.runActivity(named: "Tap Log In button") { _ in
            logInButton.tap()
        }
    }
    
    public func login() throws -> WelcomePage {
        return try XCTContext.runActivity(named: "Login") { _ in
            if logInButton.isEnabled == false {
                throw LoginPageError.loginUnavailable
            }
            logInButton.tap()
            
            if app.alerts.firstMatch.exists == true {
                throw PageError.interruptedByAlert(alert: app.alerts[Alerts.Title.InvalidLoginOrPassword.rawValue])
            }

            return try WelcomePage(application: app)
        }
    }
    
    public func tapFogotUserNameLink() {
        XCTContext.runActivity(named: "Tap Fogot User name link") { _ in
            fogotUserNameLink.tap()
        }
    }
    
    public func tapFogotPasswordLink() {
        XCTContext.runActivity(named: "Tap Fogot password link") { _ in
            fogotPasswordLink.tap()
        }
    }
    
    public func verifyAlertWithErrorMessageAppeared(_ index: Int) -> String {
        XCTContext.runActivity(named: "Verify Alert is Displayed") { _ in
            return app.alerts.staticTexts.element(boundBy: index).label
        }
    }
    
    public func getContext(_ callback: (LoginContext)->()) -> LoginPage {
        XCTContext.runActivity(named: "Get context") { _ in
            let context = LoginContext(
                isUserNameTextFieldDisplayed: userNameTextField.exists,
                isPasswordTextFieldDisplayed: passwordTextField.exists,
                isLogInButtonDisplayed: logInButton.exists,
                buttonLabel: logInButton.label,
                isFogotUserNameLinkDisplayed: fogotUserNameLink.exists,
                isFogotPasswordLinkDisplayed: fogotPasswordLink.exists)
            callback(context)
            return self
        }
    }
}
