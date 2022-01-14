//
//  CollectionViewController.swift
//  netCatDogAndOtherApp
//
//  Created by Александр Савков on 9.01.22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    private let imageArray = ["https://www.iphones.ru/wp-content/uploads/2020/12/made_1.jpg", "https://vjoy.cc/wp-content/uploads/2021/02/cute-kitty_75728_1125x2436_640.jpg", "https://vjoy.cc/wp-content/uploads/2021/02/e9fc7853879c963805934cd4fec46ac5.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl_o5I9fUnCvzqcCiAIgtdUiRZWwUPd4RlQIMnaW8j1hITdV73lRDA7SrrBFWElLWXk6s&usqp=CAU", "https://img1.akspic.ru/originals/9/3/9/8/3/138939-morda-kot-polosatyj_kot-zelenyj-koshki_malogo_i_srednego_razmera-1440x2960.jpg", "https://img3.akspic.ru/originals/2/3/2/4/6/164232-vselennaya_koshka-kot-pes-kotenok-nos-1080x1920.jpg?attachment=1", "https://img3.akspic.ru/previews/4/2/9/5/2/125924/125924-poroda_koshek-morda-kotenok-poroda-russkaya_golubaya-360x640.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width * 0.8) - 4,
                                 height: (view.frame.size.height * 0.8) - 4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CastomCollectionViewCell.self, forCellWithReuseIdentifier: CastomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastomCollectionViewCell.identifier, for: indexPath) as! CastomCollectionViewCell
        cell.configure(label: "Кот \(indexPath.row + 1)")
        return cell
    }
}
