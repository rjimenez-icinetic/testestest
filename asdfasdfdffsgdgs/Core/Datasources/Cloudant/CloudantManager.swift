//
//  CloudantManager.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 26/8/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation
import CDTDatastore

enum Cloudant {

    static let datastore = "cloudant-sync-datastore"
    static let indexSearch = "indexSearch"
}

// Define two sync directions: push and pull.
enum SyncDirection {
    case Push
    case Pull
}

class CloudantManager <T: CloudantItem>: NSObject, CDTReplicatorDelegate {
    
    var url: NSURL?
    
    var datastoreName: String?
    
    var searchIndexesCreated = false
    
    // Track pending .Push and .Pull replications here.
    var replications: [SyncDirection: CDTReplicator] = [:]
    
    var datastoreManager: CDTDatastoreManager?
    
    var datastore: CDTDatastore?
    
    var replicatorFactory: CDTReplicatorFactory?
    
    var readyToLoad: Bool! {
    
        get {
        
            return NSUserDefaults.standardUserDefaults().boolForKey(datastoreName!)
        }
        
        set {
            
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: datastoreName!)
        }
    }
    
    init(url: NSURL?, datastoreName: String?, indexes: [String]? = nil) {
        super.init()
        
        self.url = url
        self.datastoreName = datastoreName
        
        let fileManager = NSFileManager.defaultManager()
        let documentsDir = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last
        if let documentsDir = documentsDir {
            
            let storeURL = documentsDir.URLByAppendingPathComponent(Cloudant.datastore)
            if let path = storeURL.path {
            
                do {
                    datastoreManager = try CDTDatastoreManager(directory: path)
                } catch {
                    logError("Failed to initialize datastore manager: \(error)")
                }
                
                if let datastoreManager = datastoreManager, datastoreName = datastoreName {
                    
                    do {
                        datastore = try datastoreManager.datastoreNamed(datastoreName)
                    } catch {
                        logError("Failed to initialize datastore: \(error)")
                    }
                    
                    replicatorFactory = CDTReplicatorFactory(datastoreManager: datastoreManager)
                }
            }
        }
        
        // Create search and filter indexes
        if let indexes = indexes, datastore = datastore {
            
            if datastore.textSearchEnabled && indexes.count != 0 {
                
                if let _ = datastore.ensureIndexed(indexes, withName: Cloudant.indexSearch) {
                
                    searchIndexesCreated = true
                }
            }
        }
        
        if let readyToLoad = readyToLoad, datastoreName = datastoreName where readyToLoad == true {
        
            NSNotificationCenter.defaultCenter().postNotificationName(datastoreName, object: self)
        }
    }
    
    func allItems(skip: UInt, limit: UInt) -> [T]? {
        
        guard let documents = datastore?.getAllDocumentsOffset(skip, limit: limit, descending: true) else {
            return nil
        }
        
        var items: [T] = []
        for revision in documents {
            if let item = T(revision: revision) {
                items.append(item)
            }
        }
        return items
    }
    
    func find(query: [String: AnyObject], skip: UInt, limit: UInt, sort: [AnyObject]? = []) -> [T]? {
        
        guard let result = datastore?.find(query, skip: skip, limit: limit, fields: nil, sort: sort) else {
            return nil
        }
        
        var items: [T] = []
        result.enumerateObjectsUsingBlock { (revision, idx, stop) in
            if let item = T(revision: revision) {
                items.append(item)
            }
        }
        return items
    }
    
    func items(query: [String: AnyObject], skip: UInt, limit: UInt, sort: [AnyObject]?) -> [T]? {
        
        var metadata: [String: AnyObject] = [:]
        metadata["skip"] = skip
        metadata["limit"] = limit
        metadata["query"] = query
        
        if let sort = sort {
            metadata["sort"] = sort
        }
        
        debugPrint(metadata)
        
        if query.count != 0 || sort != nil {
            return find(query, skip: skip, limit: limit, sort: sort)
        } else {
            return allItems(skip, limit: limit)
        }
    }
    
    func item(dictionary: NSDictionary?) -> T? {
    
        guard let dictionary = dictionary else {
            return nil
        }
        
        return T(dictionary: dictionary)
    }
    
    func create(dictionary: NSDictionary?) throws -> T? {
    
        guard let item = item(dictionary), revision = item.revision else {
            return nil
        }
        
        do {
            if let result = try datastore?.createDocumentFromRevision(revision) {
                return T(revision: result)
            }
        }
        return nil
    }
    
    func read(identifier: String?) throws -> T? {
        
        guard let identifier = identifier, datastore = datastore else {
            return nil
        }
        
        var revision: CDTDocumentRevision
        do {
            revision = try datastore.getDocumentWithId(identifier)
            return T(revision: revision)
        } catch {
            logError("Error loading item \(identifier): \(error)")
        }
        return nil
    }
    
    func update(identifier: String?, dictionary: NSDictionary?) throws -> T? {
        
        do {
            if let item = try read(identifier), revision = item.revision {
                item.retrieve(dictionary)
                if let result = try datastore?.updateDocumentFromRevision(revision) {
                    return T(revision: result)
                }
            }
        }
        return nil
    }
    
    func delete(identifier: String?) throws -> T? {
        
        do {
            if let item = try read(identifier), revision = item.revision, result = try datastore?.deleteDocumentFromRevision(revision) {
                return T(revision: result)
            }
        }
        return nil
    }
    
    // Push or pull local data to or from the central cloud.
    func sync(direction: SyncDirection) {
        
        let existingReplication = replications[direction]
        
        guard existingReplication == nil else {
            log("Ignore \(direction) replication; already running")
            return
        }
        
        guard let datastoreManager = datastoreManager,
            url = url,
            datastore = datastore else {
            return
        }
        
        let factory = CDTReplicatorFactory(datastoreManager: datastoreManager)
        
        let job = (direction == .Push)
            ? CDTPushReplication(source: datastore, target: url)
            : CDTPullReplication(source: url, target: datastore)
        
        do {
            // Ready: Create the replication job.
            replications[direction] = try factory.oneWay(job)
            
            if let replicator = replications[direction] {
            
                // Set: Assign myself as the replication delegate.
                replicator.delegate = self
                
                // Go!
                try replicator.start()
            }
            
        } catch {
            logError("Error initializing \(direction) sync: \(error)")
            return
        }
        
        log("Started \(direction) sync: \(replications[direction])")
    }
    
    func log(msg: String, metadata: [String: AnyObject]? = nil) {
        
        debugPrint(metadata)
        
        AnalyticsManager.sharedInstance?.logger?.log(msg, level: .Info)
    }
    
    func logError(error: String) {
        
        AnalyticsManager.sharedInstance?.logger?.log(error, level: .Error)
    }

    // MARK: - <CDTReplicatorDelegate>

    @objc func replicatorDidChangeState(replicator: CDTReplicator) {
        // The new state is in replicator.state.
        debugPrint(replicator.state)
    }
    
    @objc func replicatorDidChangeProgress(replicator: CDTReplicator) {
        // See replicator.changesProcessed and replicator.changesTotal
        // for progress data.
        debugPrint("processed \(replicator.changesProcessed) of \(replicator.changesTotal)")
    }
    
    @objc func replicatorDidComplete(replicator: CDTReplicator) {
        
        debugPrint("Replication complete \(replicator)")
        
        if (replicator == replications[.Pull]) {
            
            if (replicator.changesProcessed > 0) {
                
                readyToLoad = true
                
                if let datastoreName = datastoreName {
                
                    NSNotificationCenter.defaultCenter().postNotificationName(datastoreName, object: self)
                }
            }
        }
        
        clearReplicator(replicator)
    }
    
    @objc func replicatorDidError(replicator: CDTReplicator?, info:NSError) {
        debugPrint("Replicator error \(replicator) \(info)")
        clearReplicator(replicator)
    }
    
    func clearReplicator(replicator: CDTReplicator!) {
        // Determine the replication direction, given the replicator argument.
        let direction = (replicator == replications[.Push])
            ? SyncDirection.Push
            : SyncDirection.Pull
        
        debugPrint("Clear replication: \(direction)")
        replications[direction] = nil
    }
}
