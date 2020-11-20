//
//  RegisterViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 09/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {
    @IBOutlet weak var registerBackgroundView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var registerErrorInfo: UILabel!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerErrorInfo.text = "Email Format : xyz@pqr.com \n Password Should Have Atleast 6 Characters"
        title = K.navigationBarTitle
        registerButton.layer.cornerRadius = registerButton.frame.height / 4
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let name = nameTextField.text!
        if email != "" && password != "" && name != ""{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.registerErrorInfo.text = "❗️\(e.localizedDescription)"
                } else {
                    self.db.collection(email).addDocument(data: [
                        K.fireBaseCloudStoreDocumentKey.name : name
                    ]) { (err) in
                        if let e = err {
                            print("There was an issue in saving Data Try Later..\(e)")
                        } else {
                            K.defaults.set(name, forKey: K.fireBaseCloudStoreDocumentKey.name)
                            self.performSegue(withIdentifier: K.segues.registerToUserSegue, sender: self)
                        }
                    }
                }
            }
        } else {
            registerErrorInfo.text = "❗️ Please Fill All Fields!!"
        }
    }
    
}
