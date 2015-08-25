//
//  APIEnvironmentManager.swift
//  Networking
//
//  Created by Christopher Jones on 8/15/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

import UIKit

enum APIEnvironmentError: ErrorType
{
    case InvalidSchema
    case InvalidEndpoint
}

internal class APIEnvironmentManager
{
    static let sharedManager: APIEnvironmentManager = APIEnvironmentManager()

    var currentEnvironment: APIEnvironmentContext

    required init()
    {
        self.currentEnvironment = APIEnvironment.Local
    }

    func urlForEndpoint(endpoint: String) throws -> NSURL
    {
        guard let baseUrl = NSURL(string: self.currentEnvironment.url()) else {
            throw APIEnvironmentError.InvalidSchema
        }

        guard let absoluteUrl = NSURL(string: endpoint, relativeToURL: baseUrl) else {
            throw APIEnvironmentError.InvalidEndpoint
        }
        
        

        return absoluteUrl
    }
}
