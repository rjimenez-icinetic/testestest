//
//  RestaurantsFilterViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class RestaurantsFilterViewController: FilterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterFields = [
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: RestaurantsDSItemMapping.name,
                label: "Name",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: RestaurantsDSItemMapping.description,
                label: "Description",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: RestaurantsDSItemMapping.phone,
                label: "Phone",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: RestaurantsDSItemMapping.email,
                label: "Email",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: RestaurantsDSItemMapping.address,
                label: "Address",
                viewController: self),
            
        ]

        loadFields()
    }
}
