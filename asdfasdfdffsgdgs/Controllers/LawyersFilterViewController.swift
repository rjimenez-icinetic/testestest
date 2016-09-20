//
//  LawyersFilterViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class LawyersFilterViewController: FilterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterFields = [
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: LawyersScreen1DSItemMapping.name,
                label: "Name",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: LawyersScreen1DSItemMapping.description,
                label: "Description",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: LawyersScreen1DSItemMapping.phone,
                label: "Phone",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: LawyersScreen1DSItemMapping.email,
                label: "Email",
                viewController: self),
			OptionsFilterField(datasource: datasource,
                datasourceOptions: datasourceOptions,
                name: LawyersScreen1DSItemMapping.address,
                label: "Address",
                viewController: self),
            
        ]

        loadFields()
    }
}
