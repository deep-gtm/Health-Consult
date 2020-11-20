//
//  BMICalculatorResultViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 12/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class BMICalculatorResultViewController: UIViewController {
    @IBOutlet weak var resultValueLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var recalculateButton: UIButton!
    var result: String?
    var bmiValue: String?
    var adviceText: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateButton.layer.cornerRadius = recalculateButton.frame.height / 5
        resultValueLabel.text = bmiValue
        adviceLabel.text = adviceText
        view.backgroundColor = color
        resultLabel.text = result
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
