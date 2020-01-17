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
    
    let avatarImageView: UIImageView = {
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
        avatarImageView.sd_setImage(with: url)
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        contentView.backgroundColor = .systemBackground
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, constant: 40),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
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
