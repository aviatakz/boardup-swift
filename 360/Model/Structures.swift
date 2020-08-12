//
//  User.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct User : Decodable {
    let id: Int?
    var username: String
    var email: String
    let isSuperuser: Bool
    var groups: [Group?]
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
    let isDone: Bool
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

struct Results: Decodable {
    let categories: [Categories]
    let `self`: [ResultAVG]
    let colleagues: [ResultAVG]
    let company: [ResultAVG]
}

struct ResultAVG: Decodable {
    let questionCategory: Int
    let avg: Float
}

struct Interview : Decodable {
    let id: Int
    let userId: Int
    let targetUserId: Int
    var comment: String?
    let survey: Survey
}

struct Survey : Decodable {
    let id: Int
    let name: String
    let startDate: String
    let endDate: String
    let isActive: Bool
    let questions: [Question]
}

struct Question : Decodable {
    let id: Int
    let description: String
    let categoryId: Int
    let surveyId: Int
    let createdAt: String
    let order: Int
}

struct Grade : Decodable {
    let id: Int
    var value: Int
    var questionId: Int
    var interviewId: Int
}

struct Categories : Decodable {
    let id: Int
    let name: String
}
