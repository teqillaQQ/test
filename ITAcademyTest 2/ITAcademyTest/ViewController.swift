//
//  ViewController.swift
//  ITAcademyTest
//
//  Created by Nickolai Nikishin on 16.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var label: UILabel!
        
    var counter = 5
    


    @IBAction func incrementButtonTapped(_ sender: Any)
        {
            if let sender = sender as? UIButton {
                counter += sender.tag
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "\(counter)"
        label.layer.cornerRadius = 20
        label.clipsToBounds = true

    }
        
    
}

