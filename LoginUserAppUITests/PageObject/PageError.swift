//
//  PageError.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public enum PageError: Error, Equatable {
    case preconditionViolation
    case pageNotVisible
    case notImplemented
    case interruptedByAlert(alert: XCUIElement)
}

extension PageError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .preconditionViolation:
            return NSLocalizedString("Preconditions for the test were violated", comment: "preconditionViolation")
        case .pageNotVisible:
            return NSLocalizedString("The page is not visible.", comment: "notImplemented")
        case .notImplemented:
            return NSLocalizedString("The operation has not been implemented yet.", comment: "preconditionViolation")
        case .interruptedByAlert:
            return NSLocalizedString("The operation was interrupted by an alert.", comment: "interruptedByAlert")
        }
    }
}
