//
//  SectStudentViewController.swift
//  StudentList
//
//  Created by Александр Савков on 26.11.21.
//

import UIKit

class SectStudentViewController: UIViewController, UITableViewDelegate {
    
   
    
    @IBOutlet weak var secondTable: UITableView!
    @IBOutlet weak var selectButton: UIButton!
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        if secondTable.isEditing {
            secondTable.isEditing = false
        } else {
            secondTable.isEditing = true
        }
    }
    @IBAction func selectButtonTupped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    var sellectedStudent: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTable.dataSource = self
        secondTable.delegate = self
    }
}
extension SectStudentViewController: ViewControllerDelegate {
    func didSelectedStudentCell(_ nameStudent: String) {
        selectButton.setTitle(nameStudent, for: .normal)
        dismiss(animated: true, completion: nil)
        if sellectedStudent.contains(nameStudent) {
            let alert = UIAlertController(title: "Внимание", message: "выбранный студент уже в массиве", preferredStyle: .alert)
            let alertBtn = UIAlertAction(title: "Ок", style: .default, handler: nil)
            alert.addAction(alertBtn)
            present(alert, animated: true, completion: nil)
            print("выбранный студент уже в массиве") }
        else {
            sellectedStudent.append(nameStudent) }
        secondTable.reloadData()
    }
}
extension SectStudentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(sellectedStudent.count)
        return sellectedStudent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! StudentCellSecondTableViewCell
        cell.nameLabel2.text = sellectedStudent[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            sellectedStudent.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            print(sellectedStudent)
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveStudent = sellectedStudent[sourceIndexPath.row]
        sellectedStudent.remove(at: sourceIndexPath.row)
        sellectedStudent.insert(moveStudent, at: destinationIndexPath.row)
        print(sellectedStudent)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailStudentViewController") as? DetailStudentViewController else {
            return
        }
        vc.textLabel = sellectedStudent[indexPath.row]
//        vc.detailNameclosures?(sellectedStudent[indexPath.row])
     
        present(vc, animated: true, completion: nil)
    }
}
