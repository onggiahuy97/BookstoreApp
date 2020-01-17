//
//  APIService.swift
//  AppstoreJSONApis
//
//  Created by Huy Ong on 1/3/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

//Using old school

import Foundation

class Service {
    
    static var shared = Service() //singleton
    
    func fetchBooks(searchTerm: String, completion: @escaping ([Book], Error?) -> ()) {
        
        let string = searchTerm.replacingOccurrences(of: " ", with: "+")
        print(string)
        let urlString = "https://itunes.apple.com/search?term=\(string)&entity=ebook&limit=25"
        
        guard let url = URL(string: urlString) else { return }
        //fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                print("Failed to fetch apps: ", err)
                completion([], nil)
                return
            }
            
            //success
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)

                completion(searchResult.results, nil)
                
            } catch let jsonErr{
                print("Failed to decode JSON: ", jsonErr)
                completion([], jsonErr)
            }
            
        }.resume()
    }
    
    func fetchTopPaidBook(completion: @escaping ([FeedResult]?, Error?) -> Void) {
        let string = "https://rss.itunes.apple.com/api/v1/us/books/top-paid/all/50/explicit.json"
        
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else { return }
            
            do {
                let fetchResult = try JSONDecoder().decode(BookGroup.self, from: data)
                completion(fetchResult.feed.results, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
