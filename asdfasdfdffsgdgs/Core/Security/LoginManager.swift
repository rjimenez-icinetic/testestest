//
//  LoginManager.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 12/9/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation

class LoginManager {

    let kToken = "token"
    let kSuspendDate = "suspendDate"
    let kExpirationTime = "expirationTime"

    static let sharedInstance = LoginManager()
    
    var loginService: LoginService!
    
    var token: String? {
        return NSUserDefaults.standardUserDefaults().stringForKey(kToken)
    }
    
    var suspendTime: NSTimeInterval {
        return NSUserDefaults.standardUserDefaults().doubleForKey(kSuspendDate)
    }
    
    var expirationTime: NSTimeInterval {
        return NSUserDefaults.standardUserDefaults().doubleForKey(kExpirationTime)
    }
    
    init() {
    
    }
    
    func foreground() {
    
        var expired = false
        
        if expirationTime != 0 {
            
            let interval = suspendTime + expirationTime
            let now = NSDate().timeIntervalSince1970
            
            if interval < now {
                expired = true
            }
        }
        
        if expired {
            
            let logoutAction = LogoutAction()
            if logoutAction.canBeExecuted() {
                logoutAction.execute()
            }
        }
    }
    
    func background() {
        
        let currentDate = NSDate()
        NSUserDefaults.standardUserDefaults().setDouble(currentDate.timeIntervalSince1970, forKey: kSuspendDate)
    }
    
    func reset() {
    
        NSUserDefaults.standardUserDefaults().removeObjectForKey(kToken)
        NSUserDefaults.standardUserDefaults().removeObjectForKey(kExpirationTime)
    }
    
    func isLogged() -> Bool {
    
        return token != nil
    }
    
    func update(loginResponse: LoginResponse) {
    
        if let expirationTime = loginResponse.expirationTime {
            NSUserDefaults.standardUserDefaults().setDouble(expirationTime * 60, forKey: kExpirationTime) // In seconds
        } else {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(kExpirationTime)
        }
        
        if let token = loginResponse.token {
            NSUserDefaults.standardUserDefaults().setObject(token, forKey: kToken)
        } else {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(kToken)
        }
    }
    
    func login(user: String, password: String, success: ((Void) -> Void), failure: ((NSError?) -> Void)) {
        
        loginService.login(user, password: password, success: { (response) in
            
            self.update(response)
            
        }, failure: failure)
    }
}