//
//  BookDetailView.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/16/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BookDetailView: UIViewController {
    
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        return iv
    }()
    
    var book: FeedResult! {
        didSet {
            avatarImageView.sd_setImage(with: URL(string: book.artworkUrl100))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupDoneButton()
        configureView()
    }
    
    func setupDoneButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureView() {
        view.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
    }
}
