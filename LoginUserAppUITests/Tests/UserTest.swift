//
//  UserTest.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

class UserTest: BaseTest {
    
    func testWhenTapingOnUserTabWillNavigateToUserPage() throws {
        let welcomePage = try loginPage.enterUserName(Credentials.userName)
            .enterPassword(Credentials.password)
            .login()
        
        _ = try welcomePage.getContext({(context) in
            XCTAssertTrue(context.isWelcomeTitleDisplayed)
            XCTAssertTrue(context.isLogOutButtonDisplayed)
        })
        .navigateToUser()
        .getContext({ userPageContext in
            XCTAssertTrue(userPageContext.isUserNameDisplayed)
            XCTAssertEqual(userPageContext.userNameLabel, Constants.UserProfileName)
        })
        .navigateToHome()
        .getContext({(context) in
            XCTAssertTrue(context.isWelcomeTitleDisplayed)
        })
    }
    
    func testWhenTapLogOutButtonWillNavigateToLoginPage() throws {
        _ = try loginPage.enterUserName(Credentials.userName)
            .enterPassword(Credentials.password)
            .login()
            .logOut()
            .getContext({(context) in
                XCTAssertTrue(context.isUserNameTextFieldDisplayed)
                XCTAssertTrue(context.isPasswordTextFieldDisplayed)
                XCTAssertTrue(context.isLogInButtonDisplayed)
            })
    }
}
