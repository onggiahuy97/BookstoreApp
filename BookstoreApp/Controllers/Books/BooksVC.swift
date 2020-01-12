//
//  BooksVC.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/9/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BooksVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    enum Section { case main }
    
    var books: [FeedResult] = []
    var bookGroup: [BookGroup] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, FeedResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        configureCollectionView()
        getBooks()
        configureDataSource()
    }

    func configureController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(BookCell.self, forCellWithReuseIdentifier: BookCell.reuseId)
    }
    
    func getBooks() {
        NetworkManager.shared.fetchTopFreeBook { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .failure(let err):
                print("Failed...", err)
            case .success(let booksResult):
                self.books = booksResult
                self.updataData()
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, book) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCell.reuseId, for: indexPath) as! BookCell
            cell.set(book: book)
            return cell
        })
    }
    
    func updataData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, FeedResult>()
        snapshot.appendSections([.main])
        snapshot.appendItems(books)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}
