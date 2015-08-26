//
//  PLBook.swift
//  prolificLib
//
//  Created by Phong Liew on 8/17/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

internal struct PLBook: JSONSerializable {
    
    let author: String
    let categories: String?
    let lastCheckedOut: String?
    let lastCheckedOutBy: String?
    let publisher: String?
    let title: String
    let url: String?

    init(author: String, categories: String, lastCheckedOut: String, lastCheckedOutBy: String, publisher: String, title: String, url: String?){
        
        self.author = author
        self.categories = categories
        self.lastCheckedOut = lastCheckedOut
        self.lastCheckedOutBy = lastCheckedOutBy
        self.publisher = publisher
        self.title = title
        self.url = url
    }
    
    // MARK: - Deserialization
    init?(json: JSON) {
        guard   let author: String = json.valueFor("author"),
                let title: String = json.valueFor("title")
        else{
            return nil
        }
        
        self.author = author
        self.categories = json.valueFor("categories")
        self.lastCheckedOut = json.valueFor("lastCheckedOut")
        self.lastCheckedOutBy = json.valueFor("lastCheckedOutBy")
        self.publisher = json.valueFor("publisher")
        self.title = title
        self.url = json.valueFor("url")
    }

    internal func JSONRepresentation() -> JSON? {
        var json = MutableJSON()
        json["author"] = self.author
        json["categories"] = self.categories
        json["lastCheckedOut"] = self.lastCheckedOut
        json["lastCheckedOutBy"] = self.lastCheckedOutBy
        json["publisher"] = self.publisher
        json["title"] = self.title
        json["url"] = self.url
        
        return json.jsonValue

    }
}
