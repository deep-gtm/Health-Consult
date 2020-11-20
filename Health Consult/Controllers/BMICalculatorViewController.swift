//
//  BMICalculatorViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 12/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightValueSlider: UISlider!
    @IBOutlet weak var weightValueSlider: UISlider!
    
    @IBOutlet weak var calculateButton: UIButton!
    var bmiCalculatorBrain = BMICalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = false
        title = K.navigationBarTitle
        calculateButton.layer.cornerRadius = calculateButton.frame.height / 5
        bmiCalculatorBrain.height = heightValueSlider.value
        bmiCalculatorBrain.weight = weightValueSlider.value
        heightValueLabel.text = bmiCalculatorBrain.getHeightString()
        weightValueLabel.text = bmiCalculatorBrain.getWeightString()
    }
    

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        bmiCalculatorBrain.calculateBMIValue()
        self.performSegue(withIdentifier: K.segues.bmiCalcToResultSegue, sender: self)
    }
    
    @IBAction func heightValueSliderChanged(_ sender: UISlider) {
        let heightValue = sender.value
        bmiCalculatorBrain.height = heightValue
        heightValueLabel.text = bmiCalculatorBrain.getHeightString()
    }
    
    @IBAction func weightValueSliderChanged(_ sender: UISlider) {
        let weightValue = sender.value
        bmiCalculatorBrain.weight = weightValue
        weightValueLabel.text = bmiCalculatorBrain.getWeightString()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.bmiCalcToResultSegue {
            let resultVC = segue.destination as! BMICalculatorResultViewController
            resultVC.bmiValue = bmiCalculatorBrain.getBMIString()
            resultVC.color = bmiCalculatorBrain.getColor()
            resultVC.adviceText = bmiCalculatorBrain.getAdvice()
            resultVC.result = bmiCalculatorBrain.getResult()
        }
    }
}
