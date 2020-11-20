//
//  LoginViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 09/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    @IBOutlet weak var loginBackgroundView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginErrorInfo: UILabel!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginErrorInfo.text = ""
        title = K.navigationBarTitle
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email != "" && password != "" {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.loginErrorInfo.text = "❗️\(e.localizedDescription)"
                } else {
                    self.db.collection(email).getDocuments { (querySnapshot, error) in
                        if let e = error {
                            print("There Was Error in Getting Data\(e)")
                        } else {
                            if let snapShotDocuments = querySnapshot?.documents {
                                for doc in snapShotDocuments {
                                    let data = doc.data()
                                    let name = data[K.fireBaseCloudStoreDocumentKey.name]
                                    K.defaults.set(name, forKey: K.fireBaseCloudStoreDocumentKey.name)
                                    self.performSegue(withIdentifier: K.segues.loginToUserSegue, sender: nil)
                                    K.defaults.set(true, forKey: K.login)
                                }
                            }
                        }
                    }
                }
            }
        } else {
            loginErrorInfo.text = "❗️ Please Fill All Fields!!"
        }
    }
}
