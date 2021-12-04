//
//  DetailStudentViewController.swift
//  StudentList
//
//  Created by Александр Савков on 3.12.21.
//

import UIKit

class DetailStudentViewController: UIViewController {
    
    @IBOutlet weak var detailStudentLabel: UILabel!
    var detailNameclosures: ((String) -> ())?
   
    var textLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maceRequest()
        print(textLabel)
        detailStudentLabel.text = textLabel
//        detailNameclosures? = { [weak self] (_ student: String) in
//
//                guard let self = self else { return }
//            self.textLabel = student
//
//        }
        
    }
    
    func maceRequest() {
        var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any?safe-mode")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["AuthToken": "null"]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let joke = try? JSONDecoder().decode(StudentJoke.self, from: data) {
                print(joke.setup ?? "void")
                print(joke.delivery ?? "void")
                self.textLabel = (joke.setup) ?? "void"
            }
        }
        task.resume()
    }
}



