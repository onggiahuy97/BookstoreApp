//
//  BaseListController.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/5/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
