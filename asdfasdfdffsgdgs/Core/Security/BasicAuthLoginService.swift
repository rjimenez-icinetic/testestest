//
//  BasicAuthLoginService.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 12/9/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation

class BasicAuthLoginService {
    
    var appId: String
    
    var httpClient: HttpClient<LoginResponse>
    
    var url: String {
        return "https://appbuilder-devel.buildup.io/api/app/login/\(appId)"
    }
    
    init(appId: String) {
        self.appId = appId
        httpClient = HttpClient<LoginResponse>()
    }
}

extension BasicAuthLoginService: LoginService {

    func login(user: String, password: String, success: ((LoginResponse) -> Void), failure: ((NSError?) -> Void)) {
        
        httpClient.auth(user, password: password)
        
        httpClient.post(url, parameters: nil, success: { (response) in
            
            success(response as! LoginResponse)
            
        }, failure: failure)
    }
}