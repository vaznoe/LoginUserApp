//
//  UserData.swift
//  LoginUserApp
//
//  Created by Artyom Guzenko on 25.08.2021.
//

import Foundation

struct User {
    var login: String
    var password: String
    
    static func getUserData() -> User {
        User(login: "User", password: "Password")
    }
}


