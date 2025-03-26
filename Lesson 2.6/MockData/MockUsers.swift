//
//  MockUsers.swift
//  Lesson 2.6
//
//  Created by Artem on 3/26/25.
//

struct MockDatabase: UserRepository {
    private static let users: [User] = [
        User(
            username: "User",
            password: "Password",
            person: Person(
                firstName: "Artem",
                lastName: "Slo",
                birthDate: "1987-02-14"
            )
        ),
        User(
            username: "Anna",
            password: "123",
            person: Person(
                firstName: "Anna",
                lastName: "Brown",
                birthDate: "2000-01-29"
            )
        ),
        User(
            username: "Alex",
            password: "qwerty",
            person: Person(
                firstName: "Alex",
                lastName: "Ritz",
                birthDate: "1971-10-18"
            )
        ),
    ]
    
    var allUsers: [User] {
        MockDatabase.users
    }
}
