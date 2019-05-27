//
//  HomeVC.swift
//  DemoGoogleLogin
//
//  Created by Vinod Tiwari on 25/05/19.
//  Copyright © 2019 Intellarc. All rights reserved.
//

import UIKit
import GoogleSignIn

class HomeVC: UIViewController {

    @IBOutlet weak var nameLable:UILabel!
    @IBOutlet weak var emailLable:UILabel!
    @IBOutlet weak var imageProfile:UIImageView!
    
    var user = GoogleUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        func setup() {
            uiSetup()
            setData()
        }
        setup()
    }
    
    private func uiSetup(){
        self.imageProfile.setCornerRadius(radius: self.imageProfile.frame.size.height/2, borderwidth: 4, borderColor: UIColor.black)
    }
    
    private func setData() {
        self.nameLable.text = user.name
        self.emailLable.text = user.email
        let url = URL(string: user.image ?? "" )
        let data = try? Data(contentsOf: url!)
        imageProfile.image = UIImage(data: data!)
    }
    
    @IBAction func logout(sender: AnyObject) {
        self.aletVC()
    }
 }

extension HomeVC{
 
    func aletVC()  {
        let refreshAlert = UIAlertController(title: "Logout", message: "Are you sure to logout from the Application.", preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { (action: UIAlertAction!) in
            self.logoutApp()
        }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func logoutApp(){
        if GIDSignIn.sharedInstance().hasAuthInKeychain() == true {
            GIDSignIn.sharedInstance().signOut()
            self.navigationController?.popViewController(animated: true)
        }
    }
}
