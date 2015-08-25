//
//  Response.swift
//  Networking
//
//  Created by Christopher Jones on 8/15/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

import UIKit

internal struct Response<T where T: JSONSerializable>
{
    let error: NSError?

    let data: T?

    init(data: T?, error: NSError?)
    {
        self.data = data
        self.error = error
    }

    func didSucceed() -> Bool
    {
        return (self.data != nil && self.error == nil)
    }
}
