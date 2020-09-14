//
//  User.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct Objects {
    var sectionNAme: String
    var done: Bool
    var sectionObject: [InterviewList]
}
//struct LocalData {
//    static var user = Observable<[Token]>([])
//}
struct LocalData {
    static var userId: Int = 0
    static var token: String = ""
    static var surveyId: Int = 41
}
let myNotificationKey = "com.bobthedeveloper.notificationKey"
