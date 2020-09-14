//
//  Grade.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct Grade : Decodable {
    let id: Int
    var value: Int
    var questionId: Int
    var interviewId: Int
}
