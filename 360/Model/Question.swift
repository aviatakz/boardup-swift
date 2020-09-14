//
//  Question.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct Question : Decodable {
    let id: Int
    let description: String
    let categoryId: Int
    let surveyId: Int
    let createdAt: String
    let order: Int
}
