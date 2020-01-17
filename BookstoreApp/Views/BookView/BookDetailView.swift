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
    
    let desciptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 0
        return label
    }()
    
    
    
    var book: FeedResult! {
        didSet {
            let bookDetailURl   = "https://itunes.apple.com/lookup?id=\(book.id)"
            Service.shared.fetchGenericJSONData(urlString: bookDetailURl) { (result: SearchResult?, err) in
                let bookDetail = result?.results.first
                self.bookDetail = bookDetail
            }
        }
    }
    
    var bookDetail: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupDoneButton()
        configureData()
        configureView()
    }
    
    func setupDoneButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureData() {
        avatarImageView.sd_setImage(with: URL(string: bookDetail?.artworkUrl100 ?? ""))
        desciptionLabel.text = bookDetail?.description ?? ""
    }
    
    func configureView() {
        let stack = UIStackView(arrangedSubviews: [avatarImageView, desciptionLabel])
        stack.axis = .vertical
        view.addSubview(stack)
        stack.fillSuperview()
        print(desciptionLabel.text ?? "")
    }
}
