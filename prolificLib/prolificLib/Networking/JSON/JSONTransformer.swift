//
//  JSONTransformer.swift
//  Networking
//
//  Created by Christopher Jones on 8/22/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

internal protocol JSONTransformer
{
    typealias TransformType
    func transform<TransformType>(rawType: AnyObject) -> TransformType?
}

internal struct AnyJSONTransformer<T>: JSONTransformer
{
    typealias TransformType = T

    let transformer: AnyObject -> TransformType?

    func transform<TransformType>(rawValue: AnyObject) -> TransformType?
    {
        return self.transformer(rawValue) as? TransformType
    }
}

internal func jsonTransformer<T>(transform: AnyObject -> T?) -> AnyJSONTransformer<T>
{
    return AnyJSONTransformer(transformer: transform)
}

internal struct RawRepresentableJSONTransformer<T: RawRepresentable>: JSONTransformer
{
    typealias TransformType = T

    func transform<TransformType>(rawValue: AnyObject) -> TransformType?
    {
        guard let rawValue: T.RawValue = rawValue as? T.RawValue else {
            return nil
        }

        return T(rawValue: rawValue) as? TransformType
    }
}