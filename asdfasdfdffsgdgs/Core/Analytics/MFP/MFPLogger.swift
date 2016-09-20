//
//  BluemixLogger.swift
//  ReferenceApp
//
//  Created by Icinetic on 23/8/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class MFPLogger : Logger {
    
    let logger:OCLogger
    
    init() {
        logger =  OCLogger.getInstanceWithPackage("main")
    }
    
    func log(message: String, level: LoggerLevel){
        switch level {
            case .Log: logger.logWithLevel(OCLogger_LOG, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Analytics: logger.logWithLevel(OCLogger_ANALYTICS, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Trace: logger.logWithLevel(OCLogger_TRACE, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Info: logger.logWithLevel(OCLogger_INFO, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Warn: logger.logWithLevel(OCLogger_WARN, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Debug: logger.logWithLevel(OCLogger_DEBUG, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Error: logger.logWithLevel(OCLogger_ERROR, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
            case .Fatal: logger.logWithLevel(OCLogger_FATAL, message: message, args: CVaListPointer(_fromUnsafeMutablePointer: nil), userInfo: nil)
        }
        OCLogger.send()
    }
}