//
//  CloudantDatasourceFilter.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 31/8/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import CoreLocation

class CloudantDatasourceFilter : DatasourceFilter {
    
    func create(field: String, string: String) -> StringFilter? {
        
        return CloudantStringFilter(field: field, string: string)
    }
    
    func create(field: String, stringList: [String]) -> StringListFilter? {
        
        return CloudantStringListFilter(field: field, list: stringList)
    }
    
    func create(field: String, number: Double) -> NumberFilter? {
        
        return CloudantNumberFilter(field: field, number: number)
    }
    
    func create(field: String, dateMin: NSDate?, dateMax: NSDate?) -> DateRangeFilter? {
        
        return CloudantDateRangeFilter(field: field, dateMin: dateMin, dateMax: dateMax)
    }
}

extension CloudantDatasourceFilter: DatasourceGeoFilter {
    
    func create(field: String, neCorrd: CLLocationCoordinate2D, swCoord: CLLocationCoordinate2D) -> GeoBoundingBoxFilter? {
        
        return CloudantGeoBoundingBoxFilter(field: field, neCoord: neCorrd, swCoord: swCoord)
    }
    
    func create(field: String, coord: CLLocationCoordinate2D) -> GeoNearFilter? {
        
        return CloudantGeoNearFilter(field: field, coord: coord)
    }
}

class CloudantStringFilter: StringFilter {
    
    var field: String!
    var value: AnyObject?
    var string: String?
    
    init(field: String?, string: String?) {
        
        self.field = field
        self.string = string
        value = string
    }
    
    func filter() -> String? {
        return nil
    }
}

class CloudantStringListFilter: StringListFilter {
    
    var field: String!
    var value: AnyObject?
    var list: [String]?
    
    init(field: String?, list: [String]?) {
        
        self.field = field
        self.list = list
        value = list
    }
    
    func filter() -> String? {
        return nil
    }
}

class CloudantNumberFilter : NumberFilter {
    
    var field: String!
    var value: AnyObject?
    var number: Double?
    
    init(field: String?, number: Double?) {
        
        self.field = field
        self.number = number
        value = number
    }
    
    func filter() -> String? {
        return nil
    }
}

class CloudantDateRangeFilter : DateRangeFilter {
    
    var field: String!
    var value: AnyObject?
    var dateMin: NSDate?
    var dateMax: NSDate?
    
    init(field: String?, dateMin: NSDate?, dateMax: NSDate?) {
        
        self.field = field
        self.dateMin = dateMin
        self.dateMax = dateMax
        if let dateMin = dateMin, dateMax = dateMax {
            value = [dateMin, dateMax]
        }
    }
    
    func filter() -> String? {
        return nil
    }
}

class CloudantGeoBoundingBoxFilter : GeoBoundingBoxFilter {
    
    var field: String!
    var value: AnyObject?
    var neCoord: CLLocationCoordinate2D?
    var swCoord: CLLocationCoordinate2D?
    
    init(field: String?, neCoord: CLLocationCoordinate2D?, swCoord: CLLocationCoordinate2D?) {
        
        self.field = field
        self.neCoord = neCoord
        self.swCoord = swCoord
        if let neCoord = neCoord, swCoord = swCoord {
            value = [[neCoord.longitude, neCoord.latitude], [swCoord.longitude, swCoord.latitude]]
        }
    }
    
    func filter() -> String? {
        return nil
    }
}

class CloudantGeoNearFilter : GeoNearFilter {
    
    var field: String!
    var value: AnyObject?
    var coord: CLLocationCoordinate2D?
    
    init(field: String?, coord: CLLocationCoordinate2D?) {
        
        self.field = field
        self.coord = coord
        if let coord = coord {
            value = [coord.longitude, coord.latitude]
        }
    }
    
    func filter() -> String? {
        return nil
    }
}