import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataStudent = [["Aртимович Игорь Владимирович",
                 "Богданович Дмитрий Александрович",
                 "Гришин Павел Андреевич",
                 "Куклицкий Максим Сергеевич",
                 "Лапин Николай Владимирович",
                 "Малишевский Никита Валерьевич",
                 "Матвеенко Сергей Александрови",
                 "Мостовой Алексей Алексеевич",
                 "Пачковский Михаил Тадеушевич",
                 "Савков Александр Геннадьевич",
                 "Симонов Владислав Дмитриевич",
                 "Сысов Валерий Александрович"].sorted(by: {$0 < $1}),
                ["Букаренко Арина Олеговна",
                 "Ефименко Анастасия Владимировна",
                 "Пернацкая Алеся Юрьевна",
                 "Сандова Галина Александровна",
                 "Елисеева Марина Михайловна"].sorted(by: {$0 < $1})]
    
    let headerTitles = ["Парни", "Девушки"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataStudent.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStudent[section].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return ("\(headerTitles[section]) \(dataStudent[section].count)")
            }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.nameLabel.text = dataStudent[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}

