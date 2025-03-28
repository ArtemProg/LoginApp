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
            password: "123",
            person: Person(
                firstName: "Artem",
                lastName: "Slobodchikov",
                birthDate: "1987-02-14",
                company: "Horns and Hooves, Inc.",
                department: "Nonsense",
                position: "Spiritual Mentor",
                bio: "1C isn't just code—it's an art form. And cats? They're my chief inspiration (and supervisors)."
            )
        ),
        User(
            username: "RocketMan69",
            password: "123",
            person: Person(
                firstName: "Elon",
                lastName: "Musk",
                birthDate: "1971-06-28",
                company: "Tesla, SpaceX",
                department: "Executive",
                position: "CEO",
                bio: "CEO of Tesla and SpaceX, visionary entrepreneur pushing electric cars and space colonization. Born in South Africa, he also founded Neuralink and The Boring Company. Known for his bold ideas, meme-worthy tweets, and turning sci-fi into reality."
                
            )
        ),
        User(
            username: "iTimProMax",
            password: "123",
            person: Person(
                firstName: "Tim",
                lastName: "Cook",
                birthDate: "1960-11-01",
                company: "Apple",
                department: "Executive",
                position: "CEO",
                bio: "Apple’s CEO after Steve Jobs, mastermind behind the company’s trillion-dollar growth. Openly gay tech leader focused on sustainability and privacy. Prefers quiet efficiency over flashy keynotes, but will roast competitors in a memo."
            )
        ),
    ]
    
    var allUsers: [User] {
        MockDatabase.users
    }
}
