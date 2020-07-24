//
//  LoginViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/9/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import GoogleSignIn
//import Firebase
class LoginViewController: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        if GIDSignIn.sharedInstance()?.currentUser != nil{
            self.performSegue(withIdentifier: Key.Identifier.signIn, sender: self)
        }else{
            print("Not signed in")
        }
    }
}
