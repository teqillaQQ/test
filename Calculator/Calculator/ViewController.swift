//
//  ViewController.swift
//  calculator
//
//  Created by Александр Савков on 27.10.21.
//

import UIKit

class ViewController: UIViewController {
    var numberFromDisplay: Double = 0
    var firstNumberForOperations: Double = 0
    var tipeOfOperation = 0
    var anyOperationsWereUsed = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numButtonTapped(_ sender: UIButton) {
        
        if anyOperationsWereUsed == true {
            display.text = String(sender.tag)
            anyOperationsWereUsed = false
        }
        else {
            display.text = display.text! + String(sender.tag)
        }
        numberFromDisplay = Double(display.text!)!
    }
    @IBAction func operationButtonTupped(_ sender: UIButton) {
        
        if display.text != "" && sender.tag != 10 && sender.tag != 15 { // check if any number is entered
            firstNumberForOperations = Double(display.text!)! // remember the number on the screen
            
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
            else if sender.tag == 17 { // %
                display.text = "%"
            }
            else if sender.tag == 16 { // +-
                display.text = "-\(numberFromDisplay)"
            }
            tipeOfOperation = sender.tag // remember the type of the operator so that after the button is equal to display the result
            anyOperationsWereUsed = true // math operators are used, the entered numbers will be on a new line
        }
        else if sender.tag == 10 { // AC
            display.text = ""
            firstNumberForOperations = 0
            tipeOfOperation = 0
            numberFromDisplay = 0
        }
        else if sender.tag == 15 { // =
            if tipeOfOperation == 11 {
                display.text = String(firstNumberForOperations / numberFromDisplay)
            }
            else if tipeOfOperation == 12 {
                display.text = String(firstNumberForOperations * numberFromDisplay)
            }
            else if tipeOfOperation == 13 {
                display.text = String(firstNumberForOperations - numberFromDisplay)
            }
            else if tipeOfOperation == 14 {
                display.text = String(firstNumberForOperations + numberFromDisplay)
            }
            else if tipeOfOperation == 17 {
                display.text = String(firstNumberForOperations / 100)
            }
            anyOperationsWereUsed = true
            
        }
    }
    
}


