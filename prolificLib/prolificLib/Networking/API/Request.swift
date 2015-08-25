//
//  Request.swift
//  Networking
//
//  Created by Christopher Jones on 8/15/15.
//  Copyright © 2015 Christopher Jones. All rights reserved.
//

import AFNetworking

internal class Request
{
    let endpoint: Endpoint
    let method: Method
    let params: JSON?

    private var dataTask: NSURLSessionDataTask?

    convenience init(endpoint: Endpoint, method: Method)
    {
        self.init(endpoint: endpoint, method: method, params: nil)
    }

    required init(endpoint: Endpoint, method: Method, params: JSON?)
    {
        self.endpoint = endpoint
        self.method = method
        self.params = params
    }

    func response<T where T: JSONSerializable>(responseHandler: (Response<T> -> Void)) -> Self
    {
        let urlRequest: NSURLRequest
        do {
            urlRequest = try SessionManager.sharedSession.requestWithEndpoint(self.endpoint, method: self.method, params: self.params)
        } catch {
            fatalError("Failed to instantiate URL Request.")
        }

        self.dataTask = SessionManager.sharedSession.dataTaskWithRequest(urlRequest, completionHandler: { (response: NSURLResponse!, responseObject: AnyObject?, error: NSError?) -> Void in

            if error?.code != NSURLErrorCancelled {
                let deserializedObject: T? = {
                    if let json = JSON(data: responseObject) {
                        return T(json: json)
                    }

                    return nil
                }()

                let response = Response(data: deserializedObject, error: error)
                responseHandler(response)
            }

            self.dataTask = nil
        })

        self.dataTask?.resume()

        return self
    }

    func cancel() {
        self.dataTask?.cancel()
        self.dataTask = nil
    }
}
