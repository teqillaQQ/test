//
//  ViewController.swift
//  cakculator3
//
//  Created by Александр Савков on 2.11.21.
//

import UIKit

enum BinaryOperand: Int {
    case multiply = 100 // +
    case divid = 101 // /
    case sum = 102// +
    case substract = 103 //-
}

class StoryboardedCalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var dispplayText: String = "0" {
        didSet {
            displayLabel.text = dispplayText
            
            if value1 == nil {
                
            }
        }
    }
    
    var value1: Double?
    var value2: Double?
    var operarand: BinaryOperand?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dispplayText = "0"
    }
    
    @IBAction func digitButtonTupped(_ digitButton: UIButton) {
        displayLabel.text = displayLabel.text! + String(digitButton.tag)
    }
    
    @IBAction func binaryOperatioon(_ sender: BinaryOperatorButton) {
        guard let type = BinaryOperand(rawValue: sender.tag) else {
            print("unknow type")
            return
        }
        print("type: \(type)")
    }
}

