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
    let bio: String
    
    // Данные поля следовало бы сделать отдельными сущностями,
    // где название отделов и должностей зависит от штаного расписания компании
    // но так как нам пока не требуется изменение данных свойств,
    // то оставляем их в строковом виде
    let company: String
    let department: String
    let position: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var age: Int {
        Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
    }
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    
    init(firstName: String, lastName: String, birthDate: String, company: String, department: String, position: String, bio: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = Person.formatter.date(from: birthDate) ?? Date()
        self.company = company
        self.department = department
        self.position = position
        self.bio = bio
    }
}
