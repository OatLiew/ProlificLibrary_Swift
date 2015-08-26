//
//  PLBookArray.swift
//  prolificLib
//
//  Created by Phong Liew on 8/25/15.
//  Copyright © 2015 Phong Liew. All rights reserved.
//

internal struct PLBookArray: JSONSerializable {
    let PLBookArray: [PLBook]

    init?(json: JSON){
        guard   let PLBookArray: APIResponseCollection<PLBook> = json
    else{
        return nil
    }
    
    self.PLBookArray = PLBookArray.rawValue
    
    }
    
    init(PLBookArray:[PLBook] = [PLBook]()){
        self.PLBookArray = PLBookArray

    }
    
    internal func JSONRepresentation() -> JSON? {
        var json = MutableJSON()
        json[""] = APIResponseCollection(rawValue:self.PLBookArray)?.JSONRepresentation()
        
        return json.jsonValue
    }

}