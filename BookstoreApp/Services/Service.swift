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
    
    func fetchApps(searchTerm: String, completion: @escaping ([Book], Error?) -> ()) {
        
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
    
}
