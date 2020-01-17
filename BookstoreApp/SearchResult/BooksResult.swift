//
//  BooksResult.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/9/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import Foundation

struct BookGroup: Decodable, Hashable {
    let feed: Feed
}

struct Feed: Decodable, Hashable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable, Hashable {
    var id, name, artistName, artworkUrl100: String
}
