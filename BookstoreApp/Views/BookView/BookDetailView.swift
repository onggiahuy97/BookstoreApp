//
//  BookDetailView.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/16/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BookDetailView: UIViewController {
    
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
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    var book: FeedResult! {
        didSet {
            let bookDetailURl   = "https://itunes.apple.com/lookup?id=\(book.id)"
            Service.shared.fetchGenericJSONData(urlString: bookDetailURl) { [weak self] (result: SearchResult?, err) in
                guard let self = self else { return }
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
        configureView()
        configureData()
    }
    
    func setupDoneButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureData() {
        nameLabel.text = bookDetail?.artistName
        categoryLabel.text = bookDetail?.genres.first!
        priceLabel.text = "\(bookDetail?.price ?? 0)"
        
        getButton.setTitle(bookDetail?.price == 0 ? "Free" : "$\(bookDetail?.price ?? 0)", for: .normal)
        
        let url = URL(string: bookDetail?.artworkUrl100 ?? "")
        iconImageView.sd_setImage(with: url)
        
        ratingLabel.text = setupRatingStar(averageUserRating: bookDetail?.averageUserRating ?? 0)
        ratingLabel.font = .systemFont(ofSize: 10)
        
        descriptionLabel.text = bookDetail?.description ?? ""
    }
    
    func configureView() {
        
        let stack = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        view.addSubview(stack)
        stack.spacing = 3
        
        let hstack = UIStackView(arrangedSubviews: [
            iconImageView, stack, getButton
        ])
        
        
        let vstack = VerticalStackView(arrangedSubviews: [
            hstack,
            descriptionLabel,
            UIView()
        ])
        
//        view.addSubview(hstack)
//        hstack.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
//        hstack.alignment = .center
//        hstack.spacing = 12
        
        hstack.alignment = .center
        hstack.spacing = 12
        
        view.addSubview(vstack)
        vstack.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        vstack.spacing = 12
        
        view.backgroundColor = .systemBackground
    }
}
