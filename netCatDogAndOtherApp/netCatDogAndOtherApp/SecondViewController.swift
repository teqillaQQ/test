//
//  SecondViewController.swift
//  netCatDogAndOtherApp
//
//  Created by Александр Савков on 4.01.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.6, green: 0.9, blue: 0.9, alpha: 1.0)
        setConstrains()
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                [weak self] in
                self?.showCat()
            }
        }
        
    }
    
    func showCat() {
        let urlString = randomStringImage
        let url = URL(string: urlString)
        if let data = try? Data(contentsOf: url!) {
            imageView.image = UIImage(data: data)
        }
    }
    
    private let imageArray = ["https://www.iphones.ru/wp-content/uploads/2020/12/made_1.jpg", "https://vjoy.cc/wp-content/uploads/2021/02/cute-kitty_75728_1125x2436_640.jpg", "https://vjoy.cc/wp-content/uploads/2021/02/e9fc7853879c963805934cd4fec46ac5.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl_o5I9fUnCvzqcCiAIgtdUiRZWwUPd4RlQIMnaW8j1hITdV73lRDA7SrrBFWElLWXk6s&usqp=CAU", "https://img1.akspic.ru/originals/9/3/9/8/3/138939-morda-kot-polosatyj_kot-zelenyj-koshki_malogo_i_srednego_razmera-1440x2960.jpg", "https://img3.akspic.ru/originals/2/3/2/4/6/164232-vselennaya_koshka-kot-pes-kotenok-nos-1080x1920.jpg?attachment=1", "https://img3.akspic.ru/previews/4/2/9/5/2/125924/125924-poroda_koshek-morda-kotenok-poroda-russkaya_golubaya-360x640.jpg"]
    
    private lazy var countOfImage = imageArray.count
    private lazy var randomRangeIndex = 0...countOfImage - 1
    private lazy var randomImage = randomRangeIndex.randomElement()
    private lazy var randomStringImage = imageArray[randomImage!]
}

extension SecondViewController {
    func setConstrains() {
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

