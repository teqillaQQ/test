//
//  RoundedButton.swift
//  cakculator3
//
//  Created by Александр Савков on 6.11.21.
//

import UIKit

class RoundedButton: UIButton {
    func roundCorner() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorner()
    }
}

