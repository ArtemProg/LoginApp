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
    let birthDate: Date
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    init(firstName: String, lastName: String, birthDate: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = Person.formatter.date(from: birthDate) ?? Date()
    }
}
