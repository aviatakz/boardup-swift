//
//  Results.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let categories: [Categories]
    let `self`: [ResultAVG]
    let colleagues: [ResultAVG]
    let company: [ResultAVG]
}
