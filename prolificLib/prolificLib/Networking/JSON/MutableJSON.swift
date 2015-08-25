//
//  MutableJSON.swift
//  Networking
//
//  Created by Christopher Jones on 8/24/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

internal struct MutableJSON
{
    private var rawJson = RawJSON()
    
    var jsonValue: JSON {
        get {
            return JSON(data: self.rawJson)!
        }
    }
    
    subscript(key: String) -> AnyObject? {
        get {
            return rawJson[key]
        } set {
            self.rawJson[key] = newValue
        }
    }
    
    subscript(key: String) -> JSON? {
        get {
            guard let value = self.rawJson[key] else {
                return nil
            }
            
            return JSON(data: value)
        } set {
            self.rawJson[key] = newValue?.rawValue
        }
    }
}
