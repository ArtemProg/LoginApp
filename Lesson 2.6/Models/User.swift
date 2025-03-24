//
//  User.swift
//  Lesson 2.6
//
//  Created by Artem on 3/24/25.
//

import Foundation

struct User {
    let username: String
    let password: String
    let person: Person
}

struct Person {
    let firstName: String
    let lastName: String
    let birtDate: Date
    
    init(firstName: String, lastName: String, birtDate: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        self.firstName = firstName
        self.lastName = lastName
        self.birtDate = formatter.date(from: birtDate) ?? Date()
    }
}

struct BD {
    private static let users: [User] = [
        User(
            username: "User",
            password: "Password",
            person: Person(
                firstName: "Artem",
                lastName: "Slo",
                birtDate: "1987-02-14"
            )
        ),
        User(
            username: "Anna",
            password: "123",
            person: Person(
                firstName: "Anna",
                lastName: "Brown",
                birtDate: "2000-01-29"
            )
        ),
        User(
            username: "Alex",
            password: "qwerty",
            person: Person(
                firstName: "Alex",
                lastName: "Ritz",
                birtDate: "1971-10-18"
            )
        ),
    ]
    
    static func getUsers() -> [User] {
        users
    }
}
