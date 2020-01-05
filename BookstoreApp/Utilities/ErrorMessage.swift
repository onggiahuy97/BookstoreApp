//
//  ErrorMessage.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/5/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import Foundation

enum BSError: String, Error {
    case invalidData        = "The data received from the server was invalid. Please try again."
    case invalidResponse    = "Invalid response from the server. Please try again"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidBook        = "This book's name created an invalid request. Please try again"
}
