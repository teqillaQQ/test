//
//  ViewController.swift
//  calculator
//
//  Created by Александр Савков on 27.10.21.
//

import UIKit

class ViewController: UIViewController {
    var numbersFromDisplay: Double = 0
    var firstNumber: Double = 0
    var operation = 0
    var anyOperations = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numTapped(_ sender: UIButton) {
        
        if anyOperations == true {
            display.text = String(sender.tag)
            anyOperations = false
        }
        else {
            display.text = display.text! + String(sender.tag)
        }
        numbersFromDisplay = Double(display.text!)!
    }
    @IBAction func operatorButtons(_ sender: UIButton) {
        
        if display.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNumber = Double(display.text!)!
            
            if sender.tag == 11 { // del
                display.text = "/"
            }
            else if sender.tag == 12 { // x
                display.text = "x"
            }
            else if sender.tag == 13 { // -
                display.text = "-"
            }
            else if sender.tag == 14 { // +
                display.text = "+"
            }
            operation = sender.tag
            anyOperations = true
        }
        else if sender.tag == 10 { // AC
            display.text = ""
            firstNumber = 0
            operation = 0
            numbersFromDisplay = 0
        }
        else if sender.tag == 15 { // =
            if operation == 11 {
                display.text = String(firstNumber / numbersFromDisplay)
            }
            else if operation == 12 {
                display.text = String(firstNumber * numbersFromDisplay)
            }
            else if operation == 13 {
                display.text = String(firstNumber - numbersFromDisplay)
            }
            else if operation == 14 {
                display.text = String(firstNumber + numbersFromDisplay)
            }
        }
    }
    
}


