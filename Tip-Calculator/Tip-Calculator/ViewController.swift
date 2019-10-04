//
//  ViewController.swift
//  Tip-Calculator
//
//  Created by Jay Shah on 2019-09-27.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TotalResultLabel: UILabel!
    @IBOutlet weak var amountBeforeTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    @IBOutlet weak var eachPersonSlider: UISlider!
    
    
    var tipCalculator = TipCalculator(amtBeforeTax: 0, tipPercent: 0.10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %2d%%", Int(tipPercentageSlider.value))
        calculateBill()
        //Call the calculateTip function
    }
    
    @IBAction func amountBeforeTextValueChanged(_ sender: Any) {
        calculateBill()
    }
    // stand alone Function
    @IBAction func numberOfPeopleSliderValueChanged(_ sender: Any) {
        numberOfPeopleLabel.text = "Split \(Int(eachPersonSlider.value))"
        calculateBill()
    }
    
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        //Come back and call function
        updateUI()
    }
    
    func updateUI() {
        TotalResultLabel.text = String(format: "%0.2f", tipCalculator.totalAmount)
        // each person update
        let numberOfPeople: Int = Int(eachPersonSlider.value)
        eachPersonAmountLabel.text = String(format:"%0.2f" , tipCalculator.totalAmount/Double(numberOfPeople))
    }

}

