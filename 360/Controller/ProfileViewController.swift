//
//  ProfileViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import GoogleSignIn
import Kingfisher
import Moya
import PromiseKit
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
    let provider = MoyaProvider<MyService>()
    override func viewDidLoad() {
        super.viewDidLoad()
        let activityIndicator = viewDesign.getActivityIndicator(view: view)
        activityIndicator.startAnimating()
        provider.request(.getSingleUser(userId: 16)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let user = try filteredResponse.map(User.self) // user is of type User
                        let url = URL(string: user.photo ?? "https://lh3.googleusercontent.com/a-/AOh14Ggvty4ioOpYjEgsv9IPVukR-yUyLhlkHO-Qcal-")
                        self.userImage.kf.setImage(with: url)
                        self.nameAndsurnameLabel.text = user.username
                        self.emailAddressLabel.text = user.email
                        activityIndicator.stopAnimating()
                    }catch{
                        print("Error with decoding user\(error)")
                        // Here we get either statusCode error or objectMapping error.
                        // TODO: handle the error == best. comment. ever.
                    }
            case .failure(_): break
                    // TODO: handle the error == best. comment. ever.
                }

        }
        
        
 

        
      
        userImage.image = data.getUserImage()
        viewDesign.userImageDesign(userImage)
        viewDesign.boxViewDesign(boxView)
        viewDesign.boxViewDesign(boxView2)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        self.navigationItem.title = "360"
        
    }
      
    
    @objc func handleSignOutButtonTapped() {
        let alert = UIAlertController(title: "Alert", message: "Are you Sure You want to Logout", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            GIDSignIn.sharedInstance().signOut()
            self.dismiss(animated: true, completion: nil)
    
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
