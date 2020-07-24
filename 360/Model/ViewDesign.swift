//
//  ViewDesign.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/22/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import UIKit

struct ViewDesign {
    
    func userImageDesign(_ viewImage: UIImageView) {
        viewImage.layer.cornerRadius = viewImage.frame.size.width / 2
        viewImage.clipsToBounds = true
    }
    
    func boxViewDesign(_ boxView: UIView) {
        boxView.layer.cornerRadius = 7
        boxView.layer.masksToBounds = true
    }
    
    
    
    
}
