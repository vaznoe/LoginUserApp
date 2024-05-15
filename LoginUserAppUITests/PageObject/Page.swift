//
//  Page.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public class Page: CustomStringConvertible {
    public let app: XCUIApplication
    public var description: String {
        "\(type(of: self))".titleCase()
    }
    
    public init(application: XCUIApplication, ready existence: ElementExistence) throws {
        self.app = application
        
        try pageReady(for: existence)
    }
    
    func pageReady(for existence: ElementExistence) throws {
        try XCTContext.runActivity(named: "Verify that \(self) page is visible.") { _ in
            let exists = existence.exists
            XCTAssertTrue(exists)
            if !exists {
                throw PageError.pageNotVisible
            }
        }
    }
}

