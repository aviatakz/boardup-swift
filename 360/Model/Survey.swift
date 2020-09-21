//
//  Survey.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct Survey : Decodable {
    let id: Int
    let name: String
    let start_date: String
    let end_date: String
    let is_active: Bool
    let questions: [Question]
}
