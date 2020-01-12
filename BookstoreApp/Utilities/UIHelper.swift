//
//  UIHelper.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/9/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let spacing: CGFloat = 10
        let avaialbleWidth = width - (2 * padding) - (2 * spacing)
        let itemWidth = avaialbleWidth / 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 80)
        
        return layout
    }
}
