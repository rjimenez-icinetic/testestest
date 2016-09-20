//
//  GymsFormViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//
import UIKit

class GymsFormViewController: FormViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("")
		let item = self.item as? GymsScreen1DSItem
    
		let nameField = StringField(name: GymsScreen1DSItemMapping.name, label: "Name", required: false, value: item?.name)
        contentView.addSubview(nameField)
		
		let descriptionField = StringField(name: GymsScreen1DSItemMapping.description, label: "Description", required: false, value: item?.description)
        contentView.addSubview(descriptionField)
		
		let emailField = StringField(name: GymsScreen1DSItemMapping.email, label: "Email", required: false, value: item?.email)
        contentView.addSubview(emailField)
		
		let phoneField = StringField(name: GymsScreen1DSItemMapping.phone, label: "Phone", required: false, value: item?.phone)
        contentView.addSubview(phoneField)
		
		let addressField = StringField(name: GymsScreen1DSItemMapping.address, label: "Address", required: false, value: item?.address)
        contentView.addSubview(addressField)
		
       
        updateViewConstraints()
        
        retrieveFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
