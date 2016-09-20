//
//  CloudantDatasource.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 29/8/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation
import Alamofire
import CDTDatastore

class CloudantDatasource <T: CloudantItem> {

    var cloudantManager: CloudantManager<T>
    
    var url: String!
    
    var datastoreName: String!
    
    var reachabilityManager: NetworkReachabilityManager!
    
    let filter = CloudDatasourceFilter()
    
    init(url: String!, datastoreName: String!, indexes: [String]?) {
        
        self.url = url
        self.datastoreName = datastoreName
        
        reachabilityManager = NetworkReachabilityManager(host: url)
        
        reachabilityManager.listener = { status in
            print("Network Status Changed: \(status)")
        }
        
        reachabilityManager.startListening()
        
        cloudantManager = CloudantManager(url: NSURL(string: url), datastoreName: datastoreName, indexes: indexes)
        
        if cloudantManager.readyToLoad == false {
            sync()
        }
    }
    
    deinit {
        reachabilityManager.stopListening()
    }
    
    func query(datasourceOptions: DatasourceOptions?) -> [String: AnyObject] {
    
        var query: [String: AnyObject] = [:]
        
        guard let datasourceOptions = datasourceOptions else {
            return query
        }
        
        if let searchText = datasourceOptions.searchText {
            if cloudantManager.searchIndexesCreated && !searchText.isEmpty {
                query["$text"] = ["$search": "\(searchText)*"]
            }
        }
        
        for filter in datasourceOptions.filters where filter.value != nil {
            
            query[filter.field] = filter.value!
        }
        
        for filter in datasourceOptions.designFilters where filter.value != nil {
            
            query[filter.field] = filter.value!
        }

        return query
    }
    
    func loadData<T>(query: [String: AnyObject], skip: UInt, limit: UInt, sort: [AnyObject]?, success: (([T]) -> Void), failure: ((NSError?) -> Void)) {
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            let items = self.cloudantManager.items(query, skip: skip, limit: limit, sort: sort)
            
            dispatch_async(dispatch_get_main_queue()) {
                
                if let items = items {
                    
                    var response: [T] = []
                    for item in items where item is T {
                        response.append(item as! T)
                    }
                    success(response)
                    
                } else {
                
                    failure(ErrorManager.cloudantQuery())
                }
            }
        }
    }
}

// MARK: - <Datasource>

extension CloudantDatasource : Datasource {
    
    var datasourceFilter: DatasourceFilter {
        
        return filter
    }
    
    func imagePath(path: String?) -> String? {
        
        guard let path = path else {
            return nil
        }
        
        return path
    }
    
    func refreshData<T>(options: DatasourceOptions?, success: (([T]) -> Void), failure: ((NSError?) -> Void)) {
        
        //TODO: clear cache
        if let options = options {
            options.skip = 0
        }
        loadData(options, success: success, failure: failure)
    }
    
    func loadData<T>(options: DatasourceOptions?, success: (([T]) -> Void), failure: ((NSError?) -> Void)) {
        
        var datasourceOptions = options
        if datasourceOptions == nil {
            datasourceOptions = DatasourceOptions()
        }
        
        var sort: [[String: String]]?
        if let sortOptions = datasourceOptions?.sortOptions where sortOptions.count != 0 {
            if let field = sortOptions[0].field, ascending = sortOptions[0].ascending {
                sort = [[field: ascending ? "asc" : "desc"]]
            }
        }
        
        let skip = UInt(datasourceOptions!.limit * datasourceOptions!.skip)
        
        let limit = UInt(datasourceOptions!.limit)
        
        let cloudantQuery = query(options)
        
        loadData(cloudantQuery, skip: skip, limit: limit, sort: sort, success: success, failure: failure)
    }
    
    func loadData<T>(identifier: AnyObject?, success: ((T?) -> Void), failure: ((NSError?) -> Void)) {
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            do {
                
                let item = try self.cloudantManager.read(identifier as? String)
                dispatch_async(dispatch_get_main_queue()) {
                    
                    success(item as? T)
                }
                
            } catch let error as NSError {
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    failure(error)
                }
            }
        }
    }
    
    func distinctValues(name: String, filters: [Filter]?, success: (([String]) -> Void), failure: ((NSError?) -> Void)) {
        
        //TODO
    }
}

extension CloudantDatasource: CRUD {
    
    func create<T>(params: [String : AnyObject], success: ((T?) -> Void), failure: ((NSError?) -> Void)) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            do {
                
                let item = try self.cloudantManager.create(params)
                dispatch_async(dispatch_get_main_queue()) {
                    
                    success(item as? T)
                }
                
            } catch let error as NSError {
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    failure(error)
                }
            }
        }
    }
    
    func read<T>(identifier: AnyObject?, success: ((T?) -> Void), failure: ((NSError?) -> Void)) {
        
        loadData(identifier, success: success, failure: failure)
    }
    
    func update<T>(identifier: AnyObject?, params: [String : AnyObject], success: ((T?) -> Void), failure: ((NSError?) -> Void)) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            do {
                
                let item = try self.cloudantManager.update(identifier as? String, dictionary: params)
                dispatch_async(dispatch_get_main_queue()) {
                    
                    success(item as? T)
                }
                
            } catch let error as NSError {
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    failure(error)
                }
            }
        }
    }
    
    func delete<T>(identifier: AnyObject?, success: ((T?) -> Void), failure: ((NSError?) -> Void)) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            do {
                
                let item = try self.cloudantManager.delete(identifier as? String)
                dispatch_async(dispatch_get_main_queue()) {
                    
                    success(item as? T)
                }
                
            } catch let error as NSError {
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    failure(error)
                }
            }
        }
    }
}

extension CloudantDatasource: DatasouceSync {

    func syncKey() -> String! {
        return cloudantManager.datastoreName
    }
    
    func readyToLoad() -> Bool! {
        return cloudantManager.readyToLoad
    }
    
    func sync() {
        cloudantManager.sync(.Pull)
        cloudantManager.sync(.Push)
    }
}