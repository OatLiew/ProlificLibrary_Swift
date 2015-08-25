//
//  SessionManager.swift
//  Networking
//
//  Created by Christopher Jones on 8/15/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

import AFNetworking

internal class SessionManager: AFURLSessionManager
{
    static var sharedSession : SessionManager = SessionManager(sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())

    private let requestSerializer: AFJSONRequestSerializer

    override required init(sessionConfiguration configuration: NSURLSessionConfiguration!)
    {
        self.requestSerializer = AFJSONRequestSerializer(writingOptions: NSJSONWritingOptions.PrettyPrinted)
        
        super.init(sessionConfiguration: configuration)

        self.responseSerializer = AFJSONResponseSerializer()
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    func requestWithEndpoint(endpoint: Endpoint, method: Method, params: JSON?) throws -> NSURLRequest
    {
        let url = try APIEnvironmentManager.sharedManager.urlForEndpoint(endpoint.rawValue)

        var error: NSError?
        let mutableURLRequest = SessionManager.sharedSession.requestSerializer.requestWithMethod(method.rawValue, URLString: url.absoluteString, parameters: params?.rawValue, error: &error)

        if let error = error {
            throw error
        }

        return mutableURLRequest
    }
}
