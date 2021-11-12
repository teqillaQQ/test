

import UIKit

class BinaryOperatorButton: RoundedButton {
    
    let defaultColor = UIColor.systemOrange
    let selectedColor = UIColor.white
    
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedColor : defaultColor
            print (isSelected)
        }
    }
}
