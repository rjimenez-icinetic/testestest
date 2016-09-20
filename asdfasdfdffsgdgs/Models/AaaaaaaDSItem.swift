//
//  AaaaaaaDSItem.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation

enum AaaaaaaDSItemMapping {
	static let text1 = "text1"
	static let text2 = "text2"
	static let picture = "picture"
	static let text3 = "text3"
	static let id = "id"
}

public class AaaaaaaDSItem : Item {
	
	var text1 : String?
	var text2 : String?
	var picture : String?
	var text3 : String?
	var id : String?
	
	// MAR: - <Item>

	public var identifier: AnyObject? {
		guard let identifier = id else {
			return ""
		}
		return identifier
	}
	
	required public init?(dictionary: NSDictionary?) {
    
        retrieve(dictionary)
    }
	
	public func retrieve(dictionary: NSDictionary?) {
     
        guard let dic = dictionary else {
            return
        }
        
 		text1 = dic[AaaaaaaDSItemMapping.text1] as? String
		
		text2 = dic[AaaaaaaDSItemMapping.text2] as? String
		
		picture = dic[AaaaaaaDSItemMapping.picture] as? String
		
		text3 = dic[AaaaaaaDSItemMapping.text3] as? String
		
		id = dic[AaaaaaaDSItemMapping.id] as? String
		
	   
    }
}
	
