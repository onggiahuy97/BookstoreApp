//
//  NetworkManager.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/5/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

//Using New Result<Result,Error> and Handler Error Enum Message

import Foundation

class NetworkManager {
    
    static let shared   = NetworkManager()
    let baseURL         = "https://itunes.apple.com/search?term="
    let topFreeBooksURL = "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/50/explicit.json"
    
    private init() {
        
    }
    
    func fetchBooks(for searchTerm: String, completion: @escaping (Result<[Book], BSError>) -> Void) {
        
        let string = searchTerm.replacingOccurrences(of: " ", with: "+")
        let endpoint = baseURL + "\(string)&entity=ebook&limit=20"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidBook))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let _ = err {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let books = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(.success(books.results))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func fetchTopFreeBook(loading: Int, completion: @escaping (Result<[FeedResult], BSError>) -> Void) {
        let endpoint = "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/\(loading)/explicit.json"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidBook))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let _ = err {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode(BookGroup.self, from: data)
                let books = followers.feed.results
                completion(.success(books))
            } catch {
                completion(.failure(.invalidData))
                print("Problem right here")
            }
        }
        
        task.resume()
        
    }
}
