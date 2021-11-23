

import UIKit

class MainTableViewController: UITableViewController {
    
    private let studentList = [
        Students(name: "Aртимович Игорь Владимирович", gender: .guys),
        Students(name: "Богданович Дмитрий Александрович", gender: .guys),
        Students(name: "Гришин Павел Андреевич", gender: .guys),
        Students(name: "Куклицкий Максим Сергеевич", gender: .guys),
        Students(name: "Лапин Николай Владимирович", gender: .guys),
        Students(name: "Малишевский Никита Валерьевич", gender: .guys),
        Students(name: "Матвеенко Сергей Александрови", gender: .guys),
        Students(name: "Мостовой Алексей Алексеевич", gender: .guys),
        Students(name: "Пачковский Михаил Тадеушевич", gender: .guys),
        Students(name: "Савков Александр Геннадьевич", gender: .guys),
        Students(name: "Симонов Владислав Дмитриевич", gender: .guys),
        Students(name: "Сысов Валерий Александрович", gender: .guys),
        Students(name: "Букаренко Арина Олеговна", gender: .girls),
        Students(name: "Ефименко Анастасия Владимировна", gender: .girls),
        Students(name: "Пернацкая Алеся Юрьевна", gender: .girls),
        Students(name: "Сандова Галина Александровна", gender: .girls),
        Students(name: "Елисеева Марина Михайловна", gender: .girls)]
    
    var genderSortedStudent = [[Students(name: "Aртимович Игорь Владимирович", gender: .guys),
                 Students(name: "Богданович Дмитрий Александрович", gender: .guys),
                 Students(name: "Гришин Павел Андреевич", gender: .guys),
                 Students(name: "Куклицкий Максим Сергеевич", gender: .guys),
                 Students(name: "Лапин Николай Владимирович", gender: .guys),
                 Students(name: "Малишевский Никита Валерьевич", gender: .guys),
                 Students(name: "Матвеенко Сергей Александрови", gender: .guys),
                 Students(name: "Мостовой Алексей Алексеевич", gender: .guys),
                 Students(name: "Пачковский Михаил Тадеушевич", gender: .guys),
                 Students(name: "Савков Александр Геннадьевич", gender: .guys),
                 Students(name: "Симонов Владислав Дмитриевич", gender: .guys),
                                Students(name: "Сысов Валерий Александрович", gender: .guys)].sorted(by: {$0.name < $1.name}),
                [Students(name: "Букаренко Арина Олеговна", gender: .girls),
                 Students(name: "Ефименко Анастасия Владимировна", gender: .girls),
                 Students(name: "Пернацкая Алеся Юрьевна", gender: .girls),
                 Students(name: "Сандова Галина Александровна", gender: .girls),
                 Students(name: "Елисеева Марина Михайловна", gender: .girls)].sorted(by: {$0.name < $1.name})]
    
    let headerTitles = ["Парни", "Девушки"]

    
    private var filteredStudents = [Students]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return 1
        }
        return genderSortedStudent.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredStudents.count
        }
        return genderSortedStudent[section].count
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isFiltering {
            return "найдено \(filteredStudents.count) совпадений"
        }
        if section < headerTitles.count {
            return ("\(headerTitles[section]) \(genderSortedStudent[section].count)")
            }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var student: Students
        
        if isFiltering {
            student = filteredStudents[indexPath.row]
        } else {
            student = genderSortedStudent[indexPath.section][indexPath.row]
        }
        
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.gender.rawValue
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let student: Students
                if isFiltering {
                    student = filteredStudents[indexPath.row]
                } else {
                    student = studentList[indexPath.row]
                }
                let detailVC = segue.destination as! DetailViewController
                detailVC.student = student
            }
        }
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        filteredStudents = studentList.filter({ (student: Students) -> Bool in
            return student.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

