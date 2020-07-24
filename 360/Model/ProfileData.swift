//
//  ProfileData.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/22/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import UIKit

struct ProfileData {
    
    let data = parse(pathForFile: Bundle.main.path(forResource: "data", ofType: "json")!)
    
    func getUserImage() -> UIImage?{
        return UIImage(named: "person")
    }
    
    func getNameandSurname() -> String {
        return data[0].username
    }
    
    func getEmail() -> String {
        return data[0].email
    }
    
}
