//
//  LoginViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/9/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GIDSignIn.sharedInstance().delegate = self
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        
        

    }
    @IBAction func testButton(_ sender: UIButton) {
        signIn()
    }
    
    func signIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: Key.Identifier.signIn)
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        
        present(secondVC, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if GIDSignIn.sharedInstance()?.currentUser != nil{
            signIn()
        }else{
            print("Not signed in did")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            if let error = error {
              if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
              } else {
                print("\(error.localizedDescription)")
              }
              return
            }
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
            print("Google user ID: \(userId)! ")
        print(idToken)
        
            print(  fullName ?? 0, givenName ?? 0, familyName ?? 0, email ?? 0, separator: "\n")
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(identifier: Key.Identifier.signIn)
            secondVC.modalPresentationStyle = .fullScreen
            secondVC.modalTransitionStyle = .crossDissolve
            
            present(secondVC, animated: true, completion: nil)
        
            
            
        }
        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            // Perform any operations when the user disconnects from app here.
            print("User has disconnected")
        }

    
    

}
