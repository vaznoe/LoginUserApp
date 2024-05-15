//
//  AlertHelpers.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public struct Alerts {
    public enum Responce: String {
        case Ok = "Ok"
    }
    
    public enum Title: String {
        case InvalidLoginOrPassword = "Invalid login or password"
        case OopsUsername = "Oops!"
        case OopsPassword = "Oops"
    }
}

extension XCUIElement {
    public func isAlertPermission(alerLabel: String) -> Bool {
        return self.label.contains(alerLabel)
    }
}

extension XCTestCase {
    public func responceToAlert(app: XCUIApplication, alerTitle: Alerts.Title, withResponce: Alerts.Responce, andAlertCallback callback: ((XCUIElement)->())? = nil) {
        let alert = app.alerts.firstMatch
        
        if alert.exists {
            if alert.isAlertPermission(alerLabel: alerTitle.rawValue) {
                if let callback = callback {
                    callback(alert)
                }
                let button = alert.buttons[withResponce.rawValue].firstMatch
                if button.exists {
                    button.tap()
                }
            }
        }
    }
}
