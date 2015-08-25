//
//  File.swift
//  Networking
//
//  Created by Christopher Jones on 8/21/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

internal typealias RawJSON = [String: AnyObject]

internal struct JSON: SequenceType, CustomStringConvertible
{
    typealias Generator = AnyGenerator<JSON>

    private let internalDictionary: RawJSON?

    private let internalArray: [RawJSON]?
    
    var rawValue: AnyObject? {
        get {
            if let dictionaryValue = self.internalDictionary {
                return dictionaryValue
            } else if let arrayValue = self.internalArray {
                return arrayValue
            }
            
            return nil
        }
    }
    
    var description: String {
        get {
            if let internalDictionary = self.internalDictionary {
                return internalDictionary.description
            } else if let internalArray = self.internalArray {
                return internalArray.description
            }
            
            return "{ }"
        }
    }

    init?(data: Any?)
    {
        if let dictionaryValue = data as? RawJSON {
            self.internalDictionary = dictionaryValue
            self.internalArray = nil
        } else if let arrayValue = data as? [RawJSON] {
            self.internalArray = arrayValue
            self.internalDictionary = nil
        } else {
            return nil
        }
    }

    func valueFor<T>(key: String) -> T?
    {
        return self.valueFor(key, transformer: jsonTransformer( { (rawValue: AnyObject) -> T? in
            return rawValue as? T
        }))
    }

    func valueFor<T: JSONSerializable>(key: String) -> T?
    {
        return self.valueFor(key, transformer: jsonTransformer({ (rawValue: AnyObject) -> T? in
            guard let jsonValue = JSON(data: rawValue) else {
                return nil
            }

            return T(json: jsonValue)
        }))
    }

    func valueForRaw<T: RawRepresentable>(key: String) -> T?
    {
        return valueFor(key, transformer: RawRepresentableJSONTransformer<T>() )
    }

    func valueFor<T, U: JSONTransformer>(key: String, transformer: U) -> T?
    {
        if let rawValue = self.internalDictionary?[key] {
            return transformer.transform(rawValue)
        }

        return nil
    }

    func generate() -> Generator
    {
        var index = 0
        return anyGenerator({ () -> JSON? in
            guard let array = self.internalArray else {
                return nil
            }

            if index < array.count {
                return JSON(data: array[index++])
            }

            return nil
        })
    }
}