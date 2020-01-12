//
//  BookCell.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/9/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    static let reuseId = "BookCell"
    
    let avaterImageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius   = 12
        iv.clipsToBounds        = true
        iv.backgroundColor      = .red
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text                          = "Can't hurt me"
        label.textColor                     = .label
        label.minimumScaleFactor            = 0.90
        label.adjustsFontSizeToFitWidth     = true
        label.lineBreakMode                 = .byTruncatingTail
        label.textAlignment                 = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func set(book: FeedResult) {
        usernameLabel.text = book.artistName
        let url = URL(string: book.artworkUrl100)
        avaterImageView.sd_setImage(with: url)
    }
    
    private func configure() {
        addSubview(avaterImageView)
        addSubview(usernameLabel)
        contentView.backgroundColor = .systemBackground
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avaterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avaterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avaterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avaterImageView.heightAnchor.constraint(equalTo: avaterImageView.widthAnchor, constant: 40),
            
            usernameLabel.topAnchor.constraint(equalTo: avaterImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
