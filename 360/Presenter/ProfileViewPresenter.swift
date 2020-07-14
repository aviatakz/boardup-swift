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
    @IBOutlet weak var NameSurLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var DepartmentLabel: UILabel!
    @IBOutlet weak var PositionLabel: UILabel!
    @IBOutlet weak var Department: UILabel!
    @IBOutlet weak var Position: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      var data = parse(pathForFile: Bundle.main.path(forResource: "data", ofType: "json")!)
        // Do any additional setup after loading the view.
        UserImage.image = UIImage(named: "person")
        UserImage.layer.cornerRadius = UserImage.frame.size.width / 2
        UserImage.clipsToBounds = true
        
        NameSurLabel.text = data[0].username
        EmailLabel.text = data[0].email
        DepartmentLabel.text = data[0].group[0].name
        
        
    
    }
}
