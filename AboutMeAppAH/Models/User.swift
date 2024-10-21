//
//  User.swift
//  AboutMeAppAH
//
//  Created by Artem H on 19.10.24.
//

struct User {
    let login: String
    let password: String
    let userInfo: UserInfo
    
    static func getUser() -> User {
            User(
                login: "Qwerty",
                password: "12345",
                userInfo: UserInfo.getUserInfo()
                )
    }
}

struct UserInfo {
    let name: String
    let surname: String
    let company: String
    let department: String
    let position: String
    let avatar: String
    let summary: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getUserInfo() -> UserInfo {
        UserInfo(
            name: "Artsiom",
            surname: "Hurynovich",
            company: "WF",
            department: "UX team",
            position: "Designer",
            avatar: "ArtsiomH",
            summary: "Artsiom, originally from Minsk, Belarus, currently resides in Warsaw, Poland. His life journey has been marked by interesting challenges and opportunities for personal and professional growth. Recently, Artsiom has embarked on a significant endeavor: learning Swift programming. This pursuit addresses a longstanding gap in his technical knowledge. The process of mastering this new programming language has proven both demanding and rewarding, pushing Artsiom beyond his comfort zone and significantly expanding his skill set. This coding journey reflects Artsiom's broader approach to life – embracing challenges, pursuing continuous learning, and committing to personal development. Through these experiences, Artsiom continues to evolve and adapt in an ever-changing world."
        )
    }
}
