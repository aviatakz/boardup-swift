//
//  Interview.swift
//  360
//
//  Created by Адиль Медеуев on 7/26/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

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

struct GradePOST: Decodable {
    let value: Int
    let questionId: Int
    let interviewId: Int
}

struct GroupPOST: Decodable {
    let name: String
}
