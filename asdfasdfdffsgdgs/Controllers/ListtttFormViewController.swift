//
//  ListtttFormViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//
import UIKit

class ListtttFormViewController: FormViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("")
		let item = self.item as? AaaaaaaDSItem
    
		let text1Field = StringField(name: AaaaaaaDSItemMapping.text1, label: "Text 1", required: false, value: item?.text1)
        contentView.addSubview(text1Field)
		
		let text2Field = StringField(name: AaaaaaaDSItemMapping.text2, label: "Text 2", required: false, value: item?.text2)
        contentView.addSubview(text2Field)
		
		let pictureField = ImageField(name: AaaaaaaDSItemMapping.picture, label: "Picture", required: false, viewController: self, value: crudService?.imagePath(item?.picture))
        contentView.addSubview(pictureField)
		
		let text3Field = StringField(name: AaaaaaaDSItemMapping.text3, label: "Text 3", required: false, value: item?.text3)
        contentView.addSubview(text3Field)
		
       
        updateViewConstraints()
        
        retrieveFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
