//
//  GymsScreen1DSItem.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation

enum GymsScreen1DSItemMapping {
	static let name = "name"
	static let description = "description"
	static let picture = "picture"
	static let phone = "phone"
	static let email = "email"
	static let location = "location"
	static let address = "address"
	static let id = "id"
}

public class GymsScreen1DSItem : Item {
	
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
        
 		name = dic[GymsScreen1DSItemMapping.name] as? String
		
		description = dic[GymsScreen1DSItemMapping.description] as? String
		
		picture = dic[GymsScreen1DSItemMapping.picture] as? String
		
		phone = dic[GymsScreen1DSItemMapping.phone] as? String
		
		email = dic[GymsScreen1DSItemMapping.email] as? String
		
			
		location = GeoPoint(dictionary: dic[GymsScreen1DSItemMapping.location] as? NSDictionary)
		
		address = dic[GymsScreen1DSItemMapping.address] as? String
		
		id = dic[GymsScreen1DSItemMapping.id] as? String
		
	   
    }
}
	
