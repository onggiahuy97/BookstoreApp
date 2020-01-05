//
//  BooksPageController.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/4/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BooksPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    
    override func viewDidLoad() {
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
