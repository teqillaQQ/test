//
//  ViewController.swift
//  ITAcademyTest
//
//  Created by Nickolai Nikishin on 16.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    

    @IBOutlet weak var label: UILabel!
        
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = ""
        label.layer.cornerRadius = 20
        label.clipsToBounds = true

    }

    @IBAction func incrementButtonTapped(_ sender: Any) {
        counter += 1
        label.text = """
 Increment Button
 Tapped \(counter)
"""
    }
    
    @IBAction func decrementButtonTupped(_ sender: Any) {
        counter -= 1
        label.text = """
     Decrement Button
     Tapped \(counter)
    """
    }
    
    
    
    
    
    
}

