//
//  BookSearchController.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/3/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BookSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate var bookResults = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                if let err = err {
                    print("Failed to search...", err)
                    return
                }
                
                self.bookResults = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 120)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchResultCell
        cell.bookResult = bookResults[indexPath.item]
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
