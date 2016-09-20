//
//  MenuItem0FormViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//
import UIKit

class MenuItem0FormViewController: FormViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("")
		let item = self.item as? Screen0DSItem
    
		let pictureField = ImageField(name: Screen0DSItemMapping.picture, label: "Picture", required: false, viewController: self, value: crudService?.imagePath(item?.picture))
        contentView.addSubview(pictureField)
		
		let descriptionField = StringField(name: Screen0DSItemMapping.description, label: "Description", required: false, value: item?.description)
        contentView.addSubview(descriptionField)
		
		let emailField = StringField(name: Screen0DSItemMapping.email, label: "Email", required: false, value: item?.email)
        contentView.addSubview(emailField)
		
		let phoneField = StringField(name: Screen0DSItemMapping.phone, label: "Phone", required: false, value: item?.phone)
        contentView.addSubview(phoneField)
		
		let nameField = StringField(name: Screen0DSItemMapping.name, label: "Name", required: false, value: item?.name)
        contentView.addSubview(nameField)
		
		let locationField = LocationField(name: Screen0DSItemMapping.location, label: "", required: false, viewController: self, value: item?.location)
        contentView.addSubview(locationField)
		
		let addressField = StringField(name: Screen0DSItemMapping.address, label: "", required: false, value: item?.address)
        contentView.addSubview(addressField)
		
       
        updateViewConstraints()
        
        retrieveFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
