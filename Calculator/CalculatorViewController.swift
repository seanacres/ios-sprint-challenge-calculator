//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var currentCalc: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCalc = CalculatorBrain.init()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let digitTapped = sender.titleLabel?.text {
            if digitTapped == "." {
                if let decimalThere = outputLabel.text?.contains(".") {
                    if decimalThere {
                        return
                    }
                }
            }
            outputLabel.text = currentCalc?.addOperandDigit(digitTapped)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorTapped = sender.titleLabel?.text {
            currentCalc?.setOperator(operatorTapped)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let calculation = currentCalc?.calculateIfPossible() {
            outputLabel.text = calculation
        }
        currentCalc = CalculatorBrain.init()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        currentCalc = CalculatorBrain.init()
    }
}
