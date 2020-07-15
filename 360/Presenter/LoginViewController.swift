//
//  LoginViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
//import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    //asdfjndslj

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
