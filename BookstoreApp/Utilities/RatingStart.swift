//
//  RatingStart.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/5/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import Foundation

enum RatingStart: String {
    case zeroStar   = "☆☆☆☆☆"
    case oneStar    = "★☆☆☆☆"
    case twoStar    = "★★☆☆☆"
    case threeStar  = "★★★☆☆"
    case fourStar   = "★★★★☆"
    case fiveStar   = "★★★★★"
}

func setupRatingStar(averageUserRating: Float) -> String {
    switch averageUserRating {
    case 0...0.5:
        return RatingStart.zeroStar.rawValue
    case 1...1.5:
        return RatingStart.oneStar.rawValue
    case 2...2.5:
        return RatingStart.twoStar.rawValue
    case 3...3.5:
        return RatingStart.threeStar.rawValue
    case 4...4.5:
        return RatingStart.fourStar.rawValue
    case 5:
        return RatingStart.fiveStar.rawValue
    default:
        return RatingStart.zeroStar.rawValue
    }
}
