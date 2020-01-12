//
//  BooksHeaderVerticalCell.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/8/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BooksHeaderVerticalCell: UICollectionViewCell {
    let titleLabel = UILabel(text: "Books", font: .boldSystemFont(ofSize: 30))
    
    let horizontalController = BooksHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: contentView.bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
