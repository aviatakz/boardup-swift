//
//  Interview.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
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
