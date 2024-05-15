//
//  LoginTest.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import Foundation
import XCTest

class LoginTest: BaseTest {
    
    func testVerifyLoginPageDisplayed() {
        _ = loginPage.getContext { context in
            XCTAssertTrue(context.isUserNameTextFieldDisplayed)
            XCTAssertTrue(context.isPasswordTextFieldDisplayed)
            XCTAssertTrue(context.isLogInButtonDisplayed)
            XCTAssertTrue(context.isFogotUserNameLinkDisplayed)
            XCTAssertTrue(context.isFogotPasswordLinkDisplayed)
        }
    }
    
    func testVerifyAlertAppearedWhenTryToLoginUsingValidCredentials() throws {
        XCTAssertThrowsError(try loginPage.enterUserName(Credentials.invalidUserName)
            .enterPassword(Credentials.invalidPassword)
            .login(), "Should not be able to login with invalid providing credentials.")
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(0), Constants.InvalidLoginOrPassword)
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(1), Constants.EnterCorrectLoginAndPassword)
    }
    
    func testVerifyAlertAppearedWhenTryToLoginWithoutCredentials() throws {
        XCTAssertThrowsError(try loginPage.login(), "Should not be able to login without providing credentials.")
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(0), Constants.InvalidLoginOrPassword)
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(1), Constants.EnterCorrectLoginAndPassword)
    }
    
    func testWhenLoginUsingValidCredentialsThenWelcomePageDisplayed() throws {
        _ = try loginPage.enterUserName(Credentials.userName)
            .enterPassword(Credentials.password)
            .login()
            .getContext { welcomePageContext in
                XCTAssertTrue(welcomePageContext.isWelcomeTitleDisplayed)
                XCTAssertTrue(welcomePageContext.isLogOutButtonDisplayed)
            }
    }
    
    func testWhenTapFogotUserNameLinkThenFogotUserNameModalWindowAppeared() {
        loginPage.tapFogotUserNameLink()
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(0), Constants.OopsUsername)
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(1), Constants.YourUsername)
        BaseTest().responceToAlert(
            app: app, 
            alerTitle: Alerts.Title.OopsUsername,
            withResponce: Alerts.Responce.Ok
        )
    }
    
    func testWhenTapFogotPasswordLinkThenFogotPasswordModalWindowAppeared() {
        loginPage.tapFogotPasswordLink()
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(0), Constants.OopsPassword)
        XCTAssertEqual(loginPage.verifyAlertWithErrorMessageAppeared(1), Constants.YourPassword)
        BaseTest().responceToAlert(app: app, alerTitle: Alerts.Title.OopsPassword, withResponce: Alerts.Responce.Ok)
    }
}
