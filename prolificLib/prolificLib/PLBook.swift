//
//  PLBook.swift
//  prolificLib
//
//  Created by Phong Liew on 8/17/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

import Gloss

struct PLBook: Decodable {
    
    let author: String?
    let categories: String?
    let lastCheckedOut: String?
    let lastCheckedOutBy: String?
    let publisher: String?
    let title: String?
    let url: String?
    
    // MARK: - Deserialization
    
    static func fromJSON(json: JSON) -> PLBook {
        
        return PLBook(
            author:             "author" <~~ json,
            categories:         "categories" <~~ json,
            lastCheckedOut:     "lastCheckedOut" <~~ json,
            lastCheckedOutBy:   "lastCheckedOutBy" <~~ json,
            publisher:          "publisher" <~~ json,
            title:              "title" <~~ json,
            url:                "url" <~~ json
        )
    }
    
}
