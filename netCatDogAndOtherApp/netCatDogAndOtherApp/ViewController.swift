//
//  ViewController.swift
//  netCatDogAndOtherApp
//
//  Created by Александр Савков on 4.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let presentPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("ПОКАЗАТЬ КОТЭ", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.backgroundColor = .init(red: 0, green: 255/250, blue: 204/250, alpha: 220/250)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Случайный кот"
        view.backgroundColor = .init(red: 204/250, green: 204/250, blue: 255/250, alpha: 230.0)
        setConstrains()
        showImage()
        presentPhotoButton.addTarget(self, action: #selector(presentPhotoButtonTupped), for: .touchUpInside)
        
        
    }
    
    @objc func presentPhotoButtonTupped() {
        print("Show the cat")
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func showImage() {
        let urlString = "https://static.tildacdn.com/tild6637-3037-4530-b438-356539333333/2.jpg"
        let url = URL(string: urlString)
        if let data = try? Data(contentsOf: url!) {
            imageView.image = UIImage(data: data)
            
        }
    }
    
}

extension ViewController {
    func setConstrains() {
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
        
        view.addSubview(presentPhotoButton)
        NSLayoutConstraint.activate([
            presentPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            presentPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentPhotoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            presentPhotoButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
