//
//  User.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct User : Decodable {
    let id: Int
    var username: String
    let first_name: String?
    let last_name: String?
    var email: String
    let is_superuser: Bool?
    var groups: [Group?]
    let photo: String?
}
