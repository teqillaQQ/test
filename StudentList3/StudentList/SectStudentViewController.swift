//
//  SectStudentViewController.swift
//  StudentList
//
//  Created by Александр Савков on 26.11.21.
//

import UIKit

class SectStudentViewController: UIViewController {

    
    @IBOutlet weak var selectButton: UIButton!
    @IBAction func selectButtonTupped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        vc.delegate = self
        
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension SectStudentViewController: ViewControllerDelegate {
    func didSelectedStudentCell(_ nameStudent: String) {
        selectButton.setTitle(nameStudent, for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
