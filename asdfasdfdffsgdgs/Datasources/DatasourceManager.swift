//
//  DatasourceManager.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation

class DatasourceManager {

	static let sharedInstance = DatasourceManager()
	
	lazy var EmptyDatasource: LocalDatasource<Item1> = {
    
        return LocalDatasource<Item1>(resource: DatasourceConfig.Local.EmptyDatasource.resource) 
    }()
	
	
	lazy var Screen0DS: CloudDatasource<Screen0DSItem> = {
    
        return CloudDatasource<Screen0DSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.Screen0DS.resource,
                                             apikey: DatasourceConfig.Cloud.Screen0DS.apiKey,
                                             searchableFields: [Screen0DSItemMapping.name, Screen0DSItemMapping.description, Screen0DSItemMapping.phone, Screen0DSItemMapping.email, Screen0DSItemMapping.address]) 
    }()
	
	lazy var RestaurantsDS: CloudDatasource<RestaurantsDSItem> = {
    
        return CloudDatasource<RestaurantsDSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.RestaurantsDS.resource,
                                             apikey: DatasourceConfig.Cloud.RestaurantsDS.apiKey,
                                             searchableFields: [RestaurantsDSItemMapping.name, RestaurantsDSItemMapping.description, RestaurantsDSItemMapping.phone, RestaurantsDSItemMapping.email, RestaurantsDSItemMapping.address]) 
    }()
	
	lazy var LawyersScreen1DS: CloudDatasource<LawyersScreen1DSItem> = {
    
        return CloudDatasource<LawyersScreen1DSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.LawyersScreen1DS.resource,
                                             apikey: DatasourceConfig.Cloud.LawyersScreen1DS.apiKey,
                                             searchableFields: [LawyersScreen1DSItemMapping.name, LawyersScreen1DSItemMapping.description, LawyersScreen1DSItemMapping.phone, LawyersScreen1DSItemMapping.email, LawyersScreen1DSItemMapping.address]) 
    }()
	
	lazy var GymsScreen1DS: CloudDatasource<GymsScreen1DSItem> = {
    
        return CloudDatasource<GymsScreen1DSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.GymsScreen1DS.resource,
                                             apikey: DatasourceConfig.Cloud.GymsScreen1DS.apiKey,
                                             searchableFields: [GymsScreen1DSItemMapping.name, GymsScreen1DSItemMapping.description, GymsScreen1DSItemMapping.phone, GymsScreen1DSItemMapping.email, GymsScreen1DSItemMapping.address]) 
    }()
	
	lazy var TestDS: CloudDatasource<TestDSItem> = {
    
        return CloudDatasource<TestDSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.TestDS.resource,
                                             apikey: DatasourceConfig.Cloud.TestDS.apiKey,
                                             searchableFields: [TestDSItemMapping.text1, TestDSItemMapping.text2, TestDSItemMapping.text3]) 
    }()
	
	lazy var AaaaaaaDS: CloudDatasource<AaaaaaaDSItem> = {
    
        return CloudDatasource<AaaaaaaDSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.AaaaaaaDS.resource,
                                             apikey: DatasourceConfig.Cloud.AaaaaaaDS.apiKey,
                                             searchableFields: [AaaaaaaDSItemMapping.text1, AaaaaaaDSItemMapping.text2, AaaaaaaDSItemMapping.text3]) 
    }()
	
	lazy var EdtestDS: CloudantDatasource<EdtestDSSchemaItem> = {
    
        return CloudantDatasource<EdtestDSSchemaItem>(url: DatasourceConfig.Cloudant.EdtestDS.url,
                                             datastoreName: DatasourceConfig.Cloudant.EdtestDS.datastoreName,
                                             indexes: []) 
    }()
	
	func sync() {
	
        EdtestDS.sync()
    }
}
