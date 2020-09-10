//
//  LoginViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/9/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import GoogleSignIn
import Moya
import PromiseKit
class LoginViewController: UIViewController, GIDSignInDelegate {
    let provider = MoyaProvider<MyService>()
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    
    func signIn() {
        performSegue(withIdentifier: Key.Identifier.signIn, sender: self)
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
        
            DispatchQueue.main.async {
                if let token = user.authentication.accessToken {
                    self.provider.request(.requestToken(token: token)) { result in
                        switch result {
                        case let .success(moyaResponse):
                            let data = moyaResponse.data // Data, your JSON response is probably in here!
                            let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                            print(String(data: data, encoding: .utf8))
                        case .failure(_): break
                            // TODO: handle the error == best. comment. ever.
                        }
                    }
                    self.signIn()
                }
            }
        }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            // Perform any operations when the user disconnects from app here.
            print("User has disconnected")
        }
}
