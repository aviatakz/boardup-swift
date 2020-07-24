//
//  DataFromApi.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/23/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation


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
