//
//  XCUIElement.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

extension XCUIElement {
    @discardableResult func waitForExistence() -> Bool {
        return self.waitForExistence(timeout: 5)
    }
    
    func tapAndWaitForKeyboard(allowedTime: TimeInterval = 0.5) {
        let keyboard = XCUIApplication().keyboards.element
        
        let timeIncrement: TimeInterval = 0.125
        var elapsedTime: TimeInterval = 0.0
        var continueWaiting: Bool = true
        
        while (continueWaiting) {
            self.tap()
            if (keyboard.exists) {
                break;
            }
            elapsedTime += timeIncrement
            continueWaiting = (elapsedTime < allowedTime) ? true : false
            if continueWaiting == true {
                RunLoop.current.run(until: NSDate(timeIntervalSinceNow: timeIncrement) as Date)
            }
        }
    }
}
