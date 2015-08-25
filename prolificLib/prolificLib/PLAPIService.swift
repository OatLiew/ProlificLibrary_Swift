////
////  PLAPIService.swift
////  prolificLib
////
////  Created by Phong Liew on 8/16/15.
////  Copyright (c) 2015 Phong Liew. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import Gloss
//
//final class PLAPIService {
//    
//    typealias completionType = (response: PLResponsePackage) -> (Void)
//    
//    
//    final class func get( completion: completionType) -> Void {
//
//        Alamofire
//            .request(.GET, URLString: PLEndPointConstants.getAllBooks)
//            .responseJSON {(request, response, JSON, error) in
//                
//                var responsePackage = PLResponsePackage()
//                responsePackage.response = JSON
//                responsePackage.success = true
//                responsePackage.error = error
//                completion(response: responsePackage)
//        }
//    }
//    
//    final class func post( parameters: JSON, completion: completionType) -> Void {
//    
//        Alamofire
//            .request(.POST, URLString: PLEndPointConstants.getAllBooks, parameters: parameters)
//            .responseJSON {(request, response, JSON, error) in
//                
//                var responsePackage = PLResponsePackage()
//                responsePackage.response = JSON
//                responsePackage.success = true
//                responsePackage.error = error
//                completion(response: responsePackage)
//        }
//    }
//    
//    final class func get( url: String, completion: completionType) -> Void {
//        
//        Alamofire
//            .request(.GET, URLString: PLEndPointConstants.baseURL + url)
//            .responseJSON {(request, response, JSON, error) in
//                
//                var responsePackage = PLResponsePackage()
//                responsePackage.response = JSON
//                responsePackage.success = true
//                responsePackage.error = error
//                completion(response: responsePackage)
//        }
//    }
//    
//    final class func put( url: String, parameters: JSON, completion: completionType) -> Void {
//        
//        Alamofire
//            .request(.PUT, URLString: PLEndPointConstants.baseURL + url, parameters: parameters)
//            .responseJSON {(request, response, JSON, error) in
//                
//                var responsePackage = PLResponsePackage()
//                responsePackage.response = JSON
//                responsePackage.success = true
//                responsePackage.error = error
//                completion(response: responsePackage)
//        }
//    }
//
//    
//}
