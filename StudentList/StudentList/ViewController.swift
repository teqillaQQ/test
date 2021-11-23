import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
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
    var filteredData = [[String]]()
    var shouldShowSearchResults = false
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive &&  !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        searchController.searchResultsUpdater =  self
        searchController.obscuresBackgroundDuringPresentation =  false
        searchController.searchBar.placeholder =  "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        self.navigationItem.searchController = search
    }
}

extension ViewController: UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataStudent.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredData.count
        }
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
        if isFiltering {
           dataStudent = filteredData
         } else {
           print("hello")
         }
        cell.nameLabel.text = dataStudent[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    func filterContentForSearchText(_ searchText: String) {
        filteredData = dataStudent.filter { (dataStudent: String) -> Bool in
            return dataStudent.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}




