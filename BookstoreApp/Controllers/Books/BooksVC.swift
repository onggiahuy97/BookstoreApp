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
    
    var loading: Int = 10
    var hasMoreBook = true
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, FeedResult>!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BookDetailView()
        vc.book = books[indexPath.item]
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureController()
        configureCollectionView()
        getBooks(loading: loading)
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
    
    func getBooks(loading: Int) {
        
        showLoadingView()
        
        NetworkManager.shared.fetchTopFreeBook(loading: loading) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .failure(let err):
                print("Failed...", err)
            case .success(let booksResult):
                if self.books.count >= 100 { self.hasMoreBook = false }
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

extension BooksVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
        guard hasMoreBook else { return }
            loading += 15
            getBooks(loading: loading)
        }
    }
}
