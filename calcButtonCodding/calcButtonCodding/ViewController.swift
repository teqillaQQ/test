//
//  ViewController.swift
//  calcButtonCodding
//
//  Created by Александр Савков on 2.11.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let calcButtonOne = UIButton(frame: CGRect(x: 20, y: 700, width: 80, height: 80))
        calcButtonOne.backgroundColor = .darkGray
        calcButtonOne.addTarget(self, action: #selector(pressCalcOne), for: .touchUpInside)
        self.view.addSubview(calcButtonOne)
        
        let calcButtonTwo = UIButton(frame: CGRect(x: 120, y: 700, width: 80, height: 80))
        calcButtonTwo.backgroundColor = .darkGray
        calcButtonTwo.addTarget(self, action: #selector(pressCalcTwo), for: .touchUpInside)
        self.view.addSubview(calcButtonTwo)

        let calcButtonThree = UIButton(frame: CGRect(x: 220, y: 700, width: 80, height: 80))
        calcButtonThree.backgroundColor = .darkGray
        calcButtonThree.addTarget(self, action: #selector(pressCalcThree), for: .touchUpInside)
        self.view.addSubview(calcButtonThree)
        
        let calcButtonPlus = UIButton(frame: CGRect(x: 320, y: 700, width: 80, height: 80))
        calcButtonPlus.backgroundColor = .darkGray
        calcButtonPlus.addTarget(self, action: #selector(pressCalcPlus), for: .touchUpInside)
        self.view.addSubview(calcButtonPlus)

    }
    
    @objc func pressCalcOne() {
        print ("play")
    }
    @objc func pressCalcTwo() {
        print ("play")
    }
    @objc func pressCalcThree() {
        print ("play")
    }
    @objc func pressCalcPlus() {
        print ("play")
    }


}

