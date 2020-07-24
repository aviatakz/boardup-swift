//
//  User.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct User{
     let id: Int
     var username: String
     var email: String
     let is_superuser: Bool
     var group: [Group]
    init(dict: [String: Any]) {
        id = dict["id"] as? Int ?? 0
        username = dict["username"] as? String ?? ""
        email = dict["email"] as? String ?? ""
        is_superuser = dict["is_superuser"] as? Bool ?? true
        
        group = []
        for dictGroup in dict["group"] as? [[String: Any]] ?? []{
            group.append(Group(dict: dictGroup))
        }
    }
}


