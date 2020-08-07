//
//  User.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct User : Decodable {
    let id: Int
    var username: String
    var email: String
    let isSuperuser: Bool
    var groups: [Group]
    let photo: String?
    
}


struct Group : Decodable {
    let id: Int
    var name: String
}


struct InterviewList : Decodable {
    let id: Int
    let userId: Int
    let targetUserId: Int
    let targetUser: User
    let surveyId: Int
    let createdAt: String
    let comment: String
//    let isDone: Bool
}


struct Token: Decodable {
    let token: String
    let user: User
}


struct Objects {
    var sectionNAme: String?
    var done: Bool?
    var sectionObject: [InterviewList]?
}


