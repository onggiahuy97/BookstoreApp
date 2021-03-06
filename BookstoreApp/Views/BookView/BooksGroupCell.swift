//
//  BooksGroupCell.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/5/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BooksGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Bookshelf", font: .boldSystemFont(ofSize: 30))
    
    let verticalController = BooksVerticalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(verticalController.view)
        verticalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: contentView.bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
