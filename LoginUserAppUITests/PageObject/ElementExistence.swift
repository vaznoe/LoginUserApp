//
//  ElementExistence.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest

public protocol ExistenceProviderType {
    var exists: Bool { get }
}

public struct ElementExistence: ExistenceProviderType {
    public static let exists = { Self(Operation.exists($0)) }
    
    public let existenceProvider: ExistenceProviderType
    public var exists: Bool { existenceProvider.exists}
    
    private init(_ provider: ExistenceProviderType) {
        self.existenceProvider = provider
    }
}

extension ElementExistence {
    private enum Operation: ExistenceProviderType {
        case exists(XCUIElement?)
        
        public var exists: Bool {
            switch self {
            case let .exists(element):
            return element?.exists == true
            }
        }
    }
    
    private struct Reducer: ExistenceProviderType {
        public let providers: [ExistenceProviderType]
        public let initial: Bool
        public let transform: (Bool, Bool) -> Bool
        
        public var exists: Bool {
            providers.reduce(initial) { transform($0, $1.exists) }
        }
    }
}
