//
//  Group.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/24/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct Group{
    let id: Int
    var name: String
    let created_at: String
    init(dict: [String: Any]) {
        id = dict["id"] as? Int ?? 0
        name = dict["name"] as? String ?? ""
        created_at = dict["created_at"] as? String ?? ""
    }

}
