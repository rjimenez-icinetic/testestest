//
//  TestDSItem.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation

enum TestDSItemMapping {
	static let text1 = "text1"
	static let text2 = "text2"
	static let picture = "picture"
	static let text3 = "text3"
	static let date = "date"
	static let id = "id"
}

public class TestDSItem : Item {
	
	var text1 : String?
	var text2 : String?
	var picture : String?
	var text3 : String?
	var date : NSDate?
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
        
 		text1 = dic[TestDSItemMapping.text1] as? String
		
		text2 = dic[TestDSItemMapping.text2] as? String
		
		picture = dic[TestDSItemMapping.picture] as? String
		
		text3 = dic[TestDSItemMapping.text3] as? String
		
		date = NSDate.date(dic[TestDSItemMapping.date] as? String)
		
		id = dic[TestDSItemMapping.id] as? String
		
	   
    }
}
	
