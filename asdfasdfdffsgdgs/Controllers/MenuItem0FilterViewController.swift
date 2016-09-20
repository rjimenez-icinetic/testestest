//
//  MenuItem0FilterViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class MenuItem0FilterViewController: FilterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterFields = [
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: Screen0DSItemMapping.name,
                label: "Name",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: Screen0DSItemMapping.description,
                label: "Description",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: Screen0DSItemMapping.phone,
                label: "Phone",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: Screen0DSItemMapping.email,
                label: "Email",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: Screen0DSItemMapping.address,
                label: "Address",
                viewController: self),
            
        ]

        loadFields()
    }
}
