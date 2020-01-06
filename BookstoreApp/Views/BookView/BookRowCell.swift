//
//  BookRowCell.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/5/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BookRowCell: UICollectionViewCell {
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Kevin Hart"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Comedy"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "rating"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$12.99"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack = VerticalStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingLabel
        ])
        addSubview(stack)
        stack.spacing = 3
        
        let hstack = UIStackView(arrangedSubviews: [
            iconImageView, stack, getButton
        ])
        
        addSubview(hstack)
        hstack.fillSuperview()
        hstack.alignment = .center
        hstack.spacing = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
