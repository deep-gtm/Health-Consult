//
//  IntroViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 10/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit
import Firebase
class IntroViewController: UIViewController {

    
    @IBOutlet weak var introScreenBackground: UIView!
    @IBOutlet weak var appNameLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        typingAnimation()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            if K.defaults.bool(forKey: K.login) {
                self.performSegue(withIdentifier: K.segues.introToUserSegue, sender: self)
            } else {
                self.performSegue(withIdentifier: K.segues.introLogRegSegue, sender: self)
            }
            timer.invalidate()
        }
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
