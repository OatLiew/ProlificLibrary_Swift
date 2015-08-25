//
//  ResponseCollection.swift
//  Networking
//
//  Created by Christopher Jones on 8/21/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

internal struct APIResponseCollection<T: JSONSerializable>: JSONSerializable, CollectionType, RawRepresentable
{
    typealias Index = Int
    typealias RawValue = [T]

    let internalData: [T]

    var startIndex: Index
    {
        return self.internalData.startIndex
    }

    var endIndex: Int
    {
        return self.internalData.endIndex
    }

    var rawValue: RawValue
    {
        get {
            return self.internalData
        }
    }

    subscript(index: Int) -> T
    {
        return self.internalData[index]
    }

    init?(json: JSON)
    {
        var objectArray = [T]()

        for jsonItem in json {
            guard let item = T(json: jsonItem) else {
                return nil
            }

            objectArray.append(item)
        }

        self.internalData = objectArray
    }

    init?(rawValue: RawValue)
    {
        self.internalData = rawValue
    }

    func JSONRepresentation() -> JSON?
    {
        var arrayRepresentation = [RawJSON]()
        
        for object in self {
            if let jsonRepresentation = object.JSONRepresentation()?.rawValue as? RawJSON {
                arrayRepresentation.append(jsonRepresentation)
            }
        }
        
        return JSON(data: arrayRepresentation)
    }
}