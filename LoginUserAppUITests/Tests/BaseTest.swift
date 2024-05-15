//
//  BaseTest.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

class BaseTest: XCTestCase {
    static let app: XCUIApplication = {
        let app = XCUIApplication()
        return app
    }()
    
    internal var app: XCUIApplication { Self.app }
    
    internal var loginPage: LoginPage!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        do {
            loginPage = try LoginPage(application: app)
        } catch {
            throw PageError.preconditionViolation
        }
    }
    
    override func tearDownWithError() throws {
        createTrobleshootingReport(application: app)
        app.terminate()
    }
}
