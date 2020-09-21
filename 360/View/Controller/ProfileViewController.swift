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
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    var viewModel = ProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoader()
        NotificationCenter.default.addObserver(self,
        selector: #selector(doThisWhenNotify),
        name: NSNotification.Name(rawValue: Key.Identifier.myNotificationKey),
        object: nil)
        viewModel.userInfo.bind { _ in
            self.setInfo()
            self.alert.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func setLoader() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func setNavigator() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        self.navigationItem.title = "360"
    }
    
    func setInfo() {
        viewModel.setData(image: userImage, nameandSurname: nameAndsurnameLabel, email: emailAddressLabel)
    }
    
    @objc func doThisWhenNotify() {
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
