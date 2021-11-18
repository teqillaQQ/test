

import UIKit

class RoundedButton: UIButton {
    func roundCorners() {
        layer.cornerRadius = frame.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners()
    }
}
