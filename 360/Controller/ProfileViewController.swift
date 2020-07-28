//
//  ProfileViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameAndsurnameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!

    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var boxView2: UIView!
    
    let data = ProfileData()
    let viewDesign = ViewDesign()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataFromApi.getSingleUser { (user) in
            DispatchQueue.main.async {
                self.nameAndsurnameLabel.text = user.username
                self.emailAddressLabel.text = user.email!
            }
        }
        
            
        userImage.image = data.getUserImage()
        
        
        viewDesign.userImageDesign(userImage)
        viewDesign.boxViewDesign(boxView)
        viewDesign.boxViewDesign(boxView2)
       
        
    }
    

}
