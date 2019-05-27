//
//  ViewController.swift
//  DemoGoogleLogin
//
//  Created by jayant patidar on 02/05/19.
//  Copyright © 2019 Curly Bracers. All rights reserved.
//

import UIKit
import GoogleSignIn
import SVProgressHUD
class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate  {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
   // -----------------------------------------------
   // MARK: - GOOGLE SING IN DELEGATES
   // ------------------------------------------------
 
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {
            if let fullName = user.profile.name,let email = user.profile.email,let image = user.profile.imageURL(withDimension: 100)  {
                let strImage = String(describing: image)
                let objModel = GoogleUser.init(name: fullName, image:strImage, email: email)
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                vc.user = objModel
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            print("\(error.localizedDescription)")
        }
    }
  
    @IBAction func btnLoginAction(_ sender:UIButton){
        GIDSignIn.sharedInstance().signIn()
    }
 
}

