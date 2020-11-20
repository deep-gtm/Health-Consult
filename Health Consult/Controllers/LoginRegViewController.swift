//
//  ViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 08/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class LoginRegViewController: UIViewController {
    
    @IBOutlet weak var logRegScreenBackground: UIView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.backgroundColor = K.colors.foregroundColor
        registerButton.backgroundColor = K.colors.foregroundColor
        loginButton.layer.cornerRadius = loginButton.frame.height / 5
        registerButton.layer.cornerRadius = registerButton.frame.height / 5
        appNameLabel.text = K.appName
//        typingAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    func typingAnimation() {
        var characterIndex = 0.0
        appNameLabel.text = ""
        for character in K.appName {
            Timer.scheduledTimer(withTimeInterval: 0.05 * characterIndex, repeats: false) { (timer) in
                self.appNameLabel.text?.append(character)
                timer.invalidate()
            }
            characterIndex += 1
        }
        
    }

}

