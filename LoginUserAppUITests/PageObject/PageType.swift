//
//  PageType.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public protocol PageType: AnyObject {
    var app: XCUIApplication { get }
    
    init(application: XCUIApplication) throws
}
