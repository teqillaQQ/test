//
//  ViewController.swift
//  StudentListCodTable
//
//  Created by Александр Савков on 17.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    let idCell = "Max"
    @IBOutlet weak var table: UITableView!
    var dataSource = ["Aртимович Игорь Владимирович",
                      "Богданович Дмитрий Александрович",
                      "Букаренко Арина Олеговна",
                      "Гришин Павел Андреевич",
                      "Ефименко Анастасия Владимировна",
                      "Куклицкий Максим Сергеевич",
                      "Лапин Николай Владимирович",
                      "Малишевский Никита Валерьевич",
                      "Матвеенко Сергей Александрови",
                      "Мостовой Алексей Алексеевич",
                      "Пачковский Михаил Тадеушевич",
                      "Пернацкая Алеся Юрьевна",
                      "Савков Александр Геннадьевич",
                      "Сандова Галина Александровна",
                      "Симонов Владислав Дмитриевич",
                      "Сысов Валерий Александрович",
                      "Елисеева Марина Михайловна"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
    }
}
extension ViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
    cell.textLabel?.text = dataSource[indexPath.row]
    return cell
}
}

