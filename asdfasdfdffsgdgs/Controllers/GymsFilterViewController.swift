//
//  GymsFilterViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class GymsFilterViewController: FilterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterFields = [
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: GymsScreen1DSItemMapping.name,
                label: "Name",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: GymsScreen1DSItemMapping.description,
                label: "Description",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: GymsScreen1DSItemMapping.phone,
                label: "Phone",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: GymsScreen1DSItemMapping.email,
                label: "Email",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: GymsScreen1DSItemMapping.address,
                label: "Address",
                viewController: self),
            
        ]

        loadFields()
    }
}
