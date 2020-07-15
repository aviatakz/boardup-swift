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

func parse(pathForFile: String) -> [User]{
    let data = try! Data(contentsOf: URL(fileURLWithPath: pathForFile))
    
    let dictionary = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
    let usersinfo = dictionary["User"] as! [[String: Any]]
    var returnArray: [User] = []
    for userinfo in usersinfo{
        returnArray.append(User(dict: userinfo))
    }
    return returnArray
}
