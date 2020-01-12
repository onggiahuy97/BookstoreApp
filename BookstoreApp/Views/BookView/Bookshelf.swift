//
//  Bookshelf.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/8/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class Bookshelf: UICollectionViewCell {
    
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
        label.text = "Can't hurt me"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack = VerticalStackView(arrangedSubviews: [iconImageView, nameLabel], spacing: 5)
        addSubview(stack)
        stack.fillSuperview()
        stack.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
