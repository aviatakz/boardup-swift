//
//  InterviewList.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct InterviewList : Decodable {
    let id: Int
    let userId: Int?
    let targetUserId: Int?
    let targetUser: User?
    let surveyId: Int?
    let createdAt: String?
    let comment: String
    let isDone: Bool?
}
