//
//  LoginService.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 12/9/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation

protocol LoginService {

    func login(user: String, password: String, success: ((LoginResponse) -> Void), failure: ((NSError?) -> Void))
}