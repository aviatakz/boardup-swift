//
//  ProfileViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import GoogleSignIn
import Alamofire
class ProfileViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameAndsurnameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!

    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var boxView2: UIView!
    
    var viewModel = ProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        self.navigationItem.title = "360"
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(checkAction))

        boxView2.addGestureRecognizer(gesture)
        viewModel.fetchData()
        
        let headers: HTTPHeaders = [
            "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwidXNlcm5hbWUiOiJ2bGFkaXNsYXYiLCJleHAiOjE2MDUyNjM3MTAsImVtYWlsIjoidmxhZEBhdmlhdGEubWUifQ.5IRwh-DM7EvlcvbjnTuM2_THOkEi9pgpDHDaIj-q280"
        ]

        AF.request("http://46.101.246.71:8000/users/19", headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        viewModel.fetchData()
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
