//
//  LoginResponse.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 12/9/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation

enum LoginResponseMapping {
    
    static let token = "token"
    static let expirationTime = "expirationTime"
}

public class LoginResponse : Item {
    
    var token: String?
    var expirationTime: Double?
    
    // MAR: - <Item>
    
    public var identifier: AnyObject? {
        return token
    }
    
    required public init?(dictionary: NSDictionary?) {
        
        retrieve(dictionary)
    }
    
    public func retrieve(dictionary: NSDictionary?) {
        
        guard let dic = dictionary else {
            return
        }
        
        token = dic[LoginResponseMapping.token] as? String
        
        expirationTime = dic[LoginResponseMapping.expirationTime] as? Double
    }
}