//
//  String.swift
//  LoginUserAppUITests
//
//  Created by Tatiana G on 9/22/21.
//

import Foundation

public extension String {
    func titleCase() -> String {
        return self
            .replacingOccurrences(
                of: "([A-Z])",
                with: " $1",
                options: .regularExpression,
                range: range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines).capitalized
    }
}
