//
//  XCTestCase.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

extension XCTestCase {
    public func createTrobleshootingReport(application: XCUIApplication) {
        let sema = DispatchSemaphore(value: 0)
        XCTContext.runActivity(named: "Create Trobleshooting Report") { activity in
            let elementsTree = application.debugDescription
            let attachment = XCTAttachment(string: elementsTree)
            attachment.name = "Final Screen Debug Descriptions"
            attachment.lifetime = .deleteOnSuccess
            add(attachment)
            sema.signal()
        }
        sema.wait()
    }
}
