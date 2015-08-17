//
//  PLAPIService.swift
//  prolificLib
//
//  Created by Phong Liew on 8/16/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

import Foundation
import Alamofire

final class PLAPIService {
    
    typealias completionType = (response: PLResponsePackage) -> (Void)
    
    
    final class func get(completion: completionType) -> Void {
        
        Alamofire
            .request(.GET, PLEndPointConstants.getAllBooks)
            .responseJSON {(request, response, JSON, error) in
                
                let responsePackage = PLResponsePackage()
                responsePackage.response = JSON
                responsePackage.success = true
                responsePackage.error = error
                completion(response: responsePackage)
        }
    }
    
   final class func post(completion: completionType) -> Void {
        
        Alamofire
            .request(.POST, PLEndPointConstants.getAllBooks)
            .responseJSON {(request, response, JSON, error) in
                
                let responsePackage = PLResponsePackage()
                responsePackage.response = JSON
                responsePackage.success = true
                responsePackage.error = error
                completion(response: responsePackage)
        }
    }

    
}
