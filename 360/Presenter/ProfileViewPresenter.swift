//
//  ProfileViewPresenter.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/9/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//
import UIKit

class ProfileViewPresenter: UIViewController {
    @IBOutlet weak var UserImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserImage.layer.cornerRadius = UserImage.frame.size.width / 2
        UserImage.clipsToBounds = true
    }
}
