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

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        if GIDSignIn.sharedInstance()?.currentUser != nil{
            self.performSegue(withIdentifier: "AfterLogin", sender: self)
        }else{
            print("Not signed in")
        }
    }

    @IBAction func loginPressed(_ sender: UIButton) {
//        if let email = emailTextfield.text, let password = passwordTextfield.text{
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//                if let e = error{
//                    print(e.localizedDescription)
//                }else{
//                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
//                }
//
//            //guard let strongSelf = self else { return }
//
//        }
//
//        }
        self.performSegue(withIdentifier: "AfterLogin", sender: self)
    }
    
}
