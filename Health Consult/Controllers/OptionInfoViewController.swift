//
//  OptionInfoViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 08/11/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class OptionInfoViewController: UIViewController {

    @IBOutlet weak var optionInfoHeadingLabel: UILabel!
    @IBOutlet weak var OptionInfoLabel: UILabel!
    
    var headingText: String?
    var infoText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        optionInfoHeadingLabel.text = headingText
        OptionInfoLabel.text = infoText
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
