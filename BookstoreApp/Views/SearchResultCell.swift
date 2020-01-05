//
//  SearchResultCell.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/3/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    var bookResult: Result! {
        didSet {
         
            nameLabel.text = bookResult.trackCensoredName
            categoryLabel.text = bookResult.genres.first!
            ratingLabel.text = "\(bookResult.averageUserRating ?? 0)"
            priceLabel.text = "\(bookResult.price ?? 0)"
            getButton.setTitle("$\(bookResult.price ?? 0)", for: .normal)
            let url = URL(string: bookResult.artworkUrl100)
            iconImageView.sd_setImage(with: url)
            
        }
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
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
        label.text = "9.2M"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$12.99"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hstack(
            iconImageView,
            stack(nameLabel, categoryLabel, ratingLabel, spacing: 4),
            getButton,
            spacing: 12,
            alignment: .center
        ).withMargins(.allSides(16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



struct Preview: PreviewProvider {
    static var previews: some View {
        Container()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<Preview.Container>) -> UICollectionViewController {
            return BookSearchController()
        }
        
        func updateUIViewController(_ uiViewController: UICollectionViewController, context: UIViewControllerRepresentableContext<Preview.Container>) {
            
        }
        
        typealias UIViewControllerType = UICollectionViewController
        
        
    }
}
