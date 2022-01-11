//
//  CastomCollectionViewCell.swift
//  netCatDogAndOtherApp
//
//  Created by Александр Савков on 9.01.22.
//

import UIKit

class CastomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cat")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.backgroundColor = .green
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height - 55,
                               width: contentView.frame.size.width - 10,
                               height: 50)
        
        myImageView.frame = CGRect(x: 5,
                                   y: 5,
                                   width: contentView.frame.size.width - 10,
                                   height: contentView.frame.size.height - myLabel.frame.size.height - 10)
    }
    
    public func configure(label: String) {
        myLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        
    }
    
}
