//
//  LogoutAction.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 12/9/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import UIKit

class LogoutAction: Action {

    var mainNavigation: MainNavigation!
    
    init() {
    
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            mainNavigation = appDelegate.mainNavigation
        }
    }
    
    func canBeExecuted() -> Bool {
        
        return mainNavigation.loginViewController != nil
    }
    
    func execute() {
        
        mainNavigation.logout()
    }
}