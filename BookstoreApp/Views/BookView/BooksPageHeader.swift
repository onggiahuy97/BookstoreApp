//
//  BooksPageHeader.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/6/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BooksPageHeader: UICollectionReusableView {
    
    let booksHeaderHorizontalController = BooksHeaderHorizontalController()
    let booksHeaderVerticalController = BooksHeaderVerticalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(booksHeaderHorizontalController.view)
        booksHeaderHorizontalController.view.fillSuperview()
        
        addSubview(booksHeaderVerticalController.view)
        booksHeaderVerticalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
