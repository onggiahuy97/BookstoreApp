//
//  SearchResult.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/3/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import Foundation

struct SearchResult: Codable, Hashable {
    let resultCount: Int
    let results: [Book]
}

struct Book: Codable, Hashable {
    let trackCensoredName: String
    let artworkUrl100: String
    let artistName: String
    var averageUserRating: Float?
    let genres: [String]
    var price: Float?
    let description: String
}
