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
    let rest = RestManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSingleUser()
        userImage.image = data.getUserImage()
        nameAndsurnameLabel.text = data.getNameandSurname()
        emailAddressLabel.text = data.getEmail()
        
        viewDesign.userImageDesign(userImage)
        viewDesign.boxViewDesign(boxView)
        viewDesign.boxViewDesign(boxView2)
       
        
    }
    
    func getSingleUser() {
        guard let url = URL(string: "http://46.101.246.71:8000/users/4") else { return }
        rest.urlQueryParameters.add(value: "json", forKey: "format")
        print(url)
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                print(data)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let user = try? decoder.decode(User.self, from: data) else { return }
                print(user)
            }
        }
    }
}
