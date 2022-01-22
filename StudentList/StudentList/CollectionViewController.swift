//
//  CollectionViewController.swift
//  StudentList
//
//  Created by Александр Савков on 14.01.22.
//

import UIKit

import UIKit

class CollectionViewController: UIViewController {

    private var collectionView: UICollectionView?
    var men: [StudentObject] = DataSource.menArray
    private var dataSource: [[StudentObject]] {
        [men]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        layout.itemSize = CGSize(width: (view.frame.size.width * 0.48) - 4,
                               height: (view.frame.size.height * 0.275) - 4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let student = dataSource[indexPath.section][indexPath.row]
        cell.myLabel.text = student.name
        DataSource.fetchGithubUserAvatar(student.login) { [weak cell] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    cell?.myImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return cell
    }
}
