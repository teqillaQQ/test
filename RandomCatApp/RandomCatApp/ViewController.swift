//
//  ViewController.swift
//  RandomCatApp
//
//  Created by Александр Савков on 21.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    let networksManager = NetworksManager()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let presentPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("ПОКАЗАТЬ КОТА", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.backgroundColor = .init(red: 0, green: 255/250, blue: 204/250, alpha: 220)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstrains()
        presentPhotoButton.addTarget(self, action: #selector(presentPhotoButtonTupped), for: .touchUpInside)
        showCat()
    }
    
    func showCat() {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                [weak self] in
                self?.loadImages()
            }
        }
    }
    
    @objc func presentPhotoButtonTupped() {
        imageView.isHidden = true
        showCat()
    }
    
    func loadImages()  {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        let request = NSMutableURLRequest(url: NSURL(string:  networksManager.urlPhotos)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = networksManager.headers
        
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let imageURL = try decoder.decode([Photos].self, from: data)
                guard let url = URL(string: imageURL[0].url!) else {return}
                DispatchQueue.global(qos: .userInteractive).async {
                    let images = try? Data(contentsOf: url)
                    DispatchQueue.main.async{
                        self.imageView.isHidden = false
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.hidesWhenStopped = true
                        self.imageView.image = UIImage(data: images!)}
                }
            } catch {
                self.showError(with: ErrorType.loading)
                self.activityIndicator.stopAnimating()
            }
        }.resume()
    }
    
    func showError(with type: ErrorType) {
        let myAlert = UIAlertController(title: "Error", message: type.rawValue, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        myAlert.addAction(okeyAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}

extension ViewController {
    func setConstrains() {

        view.backgroundColor = .white
        title = "Случайный кот"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
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
        
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}
