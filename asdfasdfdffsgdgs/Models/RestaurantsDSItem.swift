//
//  RestaurantsDSItem.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation

enum RestaurantsDSItemMapping {
	static let name = "name"
	static let description = "description"
	static let picture = "picture"
	static let phone = "phone"
	static let email = "email"
	static let location = "location"
	static let address = "address"
	static let id = "id"
}

public class RestaurantsDSItem : Item {
	
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
        
 		name = dic[RestaurantsDSItemMapping.name] as? String
		
		description = dic[RestaurantsDSItemMapping.description] as? String
		
		picture = dic[RestaurantsDSItemMapping.picture] as? String
		
		phone = dic[RestaurantsDSItemMapping.phone] as? String
		
		email = dic[RestaurantsDSItemMapping.email] as? String
		
			
		location = GeoPoint(dictionary: dic[RestaurantsDSItemMapping.location] as? NSDictionary)
		
		address = dic[RestaurantsDSItemMapping.address] as? String
		
		id = dic[RestaurantsDSItemMapping.id] as? String
		
	   
    }
}
	
