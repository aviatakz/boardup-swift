//
//  ProfileViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import GoogleSignIn

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
        
        let activityIndicator = viewDesign.getActivityIndicator(view: view)
        
        activityIndicator.startAnimating()
        
        DataFromApi.getSingleUser(id: 4) { (user) in
            DispatchQueue.main.async{
                                       self.nameAndsurnameLabel.text = user.username
                                       self.emailAddressLabel.text = user.email!
                       //                self.userImage.image = user.photo
                                       self.departmentLabel.text = user.groups[0].name
                activityIndicator.stopAnimating()
                                    }
            
        }
        
            
        userImage.image = data.getUserImage()
        
        
        viewDesign.userImageDesign(userImage)
        viewDesign.boxViewDesign(boxView)
        viewDesign.boxViewDesign(boxView2)
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))

        
        
       
        
    }
    
    
    
    @objc func handleSignOutButtonTapped() {
        let alert = UIAlertController(title: "Alert", message: "Are you Sure You want to Logout", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            GIDSignIn.sharedInstance().signOut()
            self.navigationController?.popViewController(animated: true)
    
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    

}
