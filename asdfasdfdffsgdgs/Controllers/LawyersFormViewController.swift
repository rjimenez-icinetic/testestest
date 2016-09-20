//
//  LawyersFormViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//
import UIKit

class LawyersFormViewController: FormViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("")
		let item = self.item as? LawyersScreen1DSItem
    
		let nameField = StringField(name: LawyersScreen1DSItemMapping.name, label: "Name", required: false, value: item?.name)
        contentView.addSubview(nameField)
		
		let descriptionField = StringField(name: LawyersScreen1DSItemMapping.description, label: "Description", required: false, value: item?.description)
        contentView.addSubview(descriptionField)
		
		let pictureField = ImageField(name: LawyersScreen1DSItemMapping.picture, label: "Picture", required: false, viewController: self, value: crudService?.imagePath(item?.picture))
        contentView.addSubview(pictureField)
		
		let phoneField = StringField(name: LawyersScreen1DSItemMapping.phone, label: "Phone", required: false, value: item?.phone)
        contentView.addSubview(phoneField)
		
		let emailField = StringField(name: LawyersScreen1DSItemMapping.email, label: "Email", required: false, value: item?.email)
        contentView.addSubview(emailField)
		
		let locationField = LocationField(name: LawyersScreen1DSItemMapping.location, label: "Location", required: false, viewController: self, value: item?.location)
        contentView.addSubview(locationField)
		
		let addressField = StringField(name: LawyersScreen1DSItemMapping.address, label: "Address", required: false, value: item?.address)
        contentView.addSubview(addressField)
		
       
        updateViewConstraints()
        
        retrieveFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
