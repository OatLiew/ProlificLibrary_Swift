//
//  APIEnvironment.swift
//  Networking
//
//  Created by Christopher Jones on 8/15/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

import UIKit

internal enum APIEnvironment: String, APIEnvironmentContext
{
    case Local = "http://prolific-interview.herokuapp.com/55ba3d17430a1d0009161088/"
    
    func url() -> String
    {
        return self.rawValue
    }
}