//
//  BooksHeaderCell.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/6/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BooksHeaderCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Kevin Hart", font: .boldSystemFont(ofSize: 12))
    
    let discriptionLabel = UILabel(text: "Be positive in mind and make your life simple then enjoy it", font: .systemFont(ofSize: 24))
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        discriptionLabel.textColor      = .black
        imageView.backgroundColor   = .red
        discriptionLabel.numberOfLines    = 2
        
        let stackView = VerticalStackView(arrangedSubviews: [
            titleLabel,
            discriptionLabel,
            imageView
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
