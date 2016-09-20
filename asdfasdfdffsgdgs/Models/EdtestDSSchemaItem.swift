//
//  EdtestDSSchemaItem.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation
import CDTDatastore

enum EdtestDSSchemaItemMapping {
	static let text_Caa = "text_Çàâ"
	static let int____ = "int_ｱｲｳ"
	static let decimal____ = "decimal_Дфэ"
	static let datetime____ = "datetime_अइउ"
	static let text_3 = "text_3"
	static let last_Column = "Last_Column"
}

public class EdtestDSSchemaItem : Item, CloudantItem {
	
	var text_Caa : String?{
		didSet {
			if let revision = revision {
				revision.body[EdtestDSSchemaItemMapping.text_Caa] = text_Caa
			}
		}
	}
	
	var int____ : Int?{
		didSet {
			if let revision = revision {
				revision.body[EdtestDSSchemaItemMapping.int____] = int____
			}
		}
	}
	
	var decimal____ : Double?{
		didSet {
			if let revision = revision {
				revision.body[EdtestDSSchemaItemMapping.decimal____] = decimal____
			}
		}
	}
	
	var datetime____ : String?{
		didSet {
			if let revision = revision {
				revision.body[EdtestDSSchemaItemMapping.datetime____] = datetime____
			}
		}
	}
	
	var text_3 : String?{
		didSet {
			if let revision = revision {
				revision.body[EdtestDSSchemaItemMapping.text_3] = text_3
			}
		}
	}
	
	var last_Column : String?{
		didSet {
			if let revision = revision {
				revision.body[EdtestDSSchemaItemMapping.last_Column] = last_Column
			}
		}
	}
	
	
	public var revision: CDTDocumentRevision? {
    
        didSet {
            if let revision = revision {
                retrieve(revision.body)
            }
        }
    }
	
	public var identifier: AnyObject? {
        if let revision = revision {
            return revision.docId
        }
        return nil
    }
	
	required public init?(dictionary: NSDictionary?) {
        revision = CDTDocumentRevision()
        revision?.body = NSMutableDictionary()
        retrieve(dictionary)
    }
    
    required public init?(revision: CDTDocumentRevision) {
        self.revision = revision
        retrieve(revision.body)
    }
    
    public func retrieve(dictionary: NSDictionary?) {
        guard let dic = dictionary else {
            return
        }
 		text_Caa = dic[EdtestDSSchemaItemMapping.text_Caa] as? String
		
		int____ = dic[EdtestDSSchemaItemMapping.int____] as? Int
		
		decimal____ = dic[EdtestDSSchemaItemMapping.decimal____] as? Double
		
		datetime____ = dic[EdtestDSSchemaItemMapping.datetime____] as? String
		
		text_3 = dic[EdtestDSSchemaItemMapping.text_3] as? String
		
		last_Column = dic[EdtestDSSchemaItemMapping.last_Column] as? String
		
    }
}
	
