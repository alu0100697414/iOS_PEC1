//
//  CalculatorViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // BEGIN-UOC-7.1
    
    @IBOutlet weak var initialAmountLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var finalAmountSlider: UILabel!
    @IBOutlet weak var initialAmountSlider: UISlider!
    @IBOutlet weak var interestRateStepper: UIStepper!
    @IBOutlet weak var yearsStepper: UIStepper!

    // END-UOC-7.1
    
    
    // BEGIN-UOC-7.2
    
    // Updates the amount
    @IBAction func amountChange(_ sender: UISlider) {
        
        initialAmountLabel.text = "Initial amount: " + String(format: "%.0f", initialAmountSlider.value) + " €";
        updateFinalAmount();
    }
    
    // Updates the interest
    @IBAction func interestChange(_ sender: UIStepper) {
        
        interestRateLabel.text = "Interest rate: " + String(format: "%.2f", interestRateStepper.value) + " %";
        updateFinalAmount();
    }
    
    // Updates the year
    @IBAction func yearChange(_ sender: UIStepper) {
        
        yearsLabel.text = "Years: " + String(format: "%.0f", yearsStepper.value);
        updateFinalAmount();
    }
    
    // Updates the final amount
    func updateFinalAmount() {
        
        let finalAmount = Services.calculateFinalAmount(ForAmount: initialAmountSlider.value, WithInterest: interestRateStepper.value/100, AndYears: yearsStepper.value);
        finalAmountSlider.text = "Final amount: " + String(format: "%.2f", finalAmount) + " €";
    }

    // END-UOC-7.2
    
    
    // BEGIN-UOC-7.3
    
    // Set initial values
    override func viewDidLoad() {
        
        initialAmountLabel.text = "Initial amount: 100 €";
        interestRateLabel.text = "Interest rate: 1.00 %";
        yearsLabel.text = "Years: 1";
        
        updateFinalAmount();
    }

    // END-UOC-7.3
}
