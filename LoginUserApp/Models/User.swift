//
//  User.swift
//  LoginUserApp
//
//  Created by Tatiana G on 9/22/21.
//
struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserInfo() -> User {
        User(
            login: "user",
            password: "password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Tatiana", surname: "Vaznoe")
    }
}
