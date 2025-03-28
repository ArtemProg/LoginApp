//
//  User.swift
//  Lesson 2.6
//
//  Created by Artem on 3/24/25.
//

import Foundation

struct User {
    let id = UUID()
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            username: "User",
            password: "123",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let bio: String
    let job: Company
    let photo: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    static func getPerson() -> Person {
        Person(
            firstName: "Artem",
            lastName: "Kolt",
            bio: "1C isn't just code—it's an art form. And cats? They're my chief inspiration (and supervisors).",
            job: Company.getCompany(),
            photo: "RocketMan69"
        )
    }
}

struct Company {
    let title: String
    let jobTitle: JobTitle
    let department: Department
    
    static func getCompany() -> Company {
        Company(
            title: "Horns and Hooves, Inc.",
            jobTitle: .spiritualMentor,
            department: .nonsense
        )
    }
}

enum JobTitle: String {
    case spiritualMentor = "Spiritual Mentor"
    case programmer = "Programmer"
}

enum Department: String {
    case nonsense = "Nonsense"
    case tagging = "Tagging"
}
