//
//  LawyersScreen1DSItem.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation

enum LawyersScreen1DSItemMapping {
	static let name = "name"
	static let description = "description"
	static let picture = "picture"
	static let phone = "phone"
	static let email = "email"
	static let location = "location"
	static let address = "address"
	static let id = "id"
}

public class LawyersScreen1DSItem : Item {
	
	var name : String?
	var description : String?
	var picture : String?
	var phone : String?
	var email : String?
	var location : GeoPoint?
	var address : String?
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
        
 		name = dic[LawyersScreen1DSItemMapping.name] as? String
		
		description = dic[LawyersScreen1DSItemMapping.description] as? String
		
		picture = dic[LawyersScreen1DSItemMapping.picture] as? String
		
		phone = dic[LawyersScreen1DSItemMapping.phone] as? String
		
		email = dic[LawyersScreen1DSItemMapping.email] as? String
		
			
		location = GeoPoint(dictionary: dic[LawyersScreen1DSItemMapping.location] as? NSDictionary)
		
		address = dic[LawyersScreen1DSItemMapping.address] as? String
		
		id = dic[LawyersScreen1DSItemMapping.id] as? String
		
	   
    }
}
	
