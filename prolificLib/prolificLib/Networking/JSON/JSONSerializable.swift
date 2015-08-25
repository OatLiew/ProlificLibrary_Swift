//
//  JSONSerializable.swift
//  Networking
//
//  Created by Christopher Jones on 8/15/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

internal protocol JSONSerializable
{
    init?(json: JSON)
    func JSONRepresentation() -> JSON?
}