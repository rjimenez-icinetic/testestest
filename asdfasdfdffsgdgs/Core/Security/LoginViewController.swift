//
//  LoginViewController.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 12/9/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: InputViewController {
    
    let kUser = "user"
    let kPass = "pass"
    
    var userField: StringField!
    var passwordField: StringField!
    
    var loginService: LoginService?
    
    var mainViewController: UIViewController?
    
    var user: String? {
        return NSUserDefaults.standardUserDefaults().stringForKey(kUser)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBarHidden = true
        
        if let logo = UIImage(named: Images.logo) {
            let imageView = UIImageView(image: logo)
            imageView.contentMode = .ScaleAspectFit
            let logoContainer = ContainerView(contentView: imageView)
            logoContainer.contentInsets.top = Dimens.Margins.xlarge
            contentView.addSubview(logoContainer)
        }
        
        if let appName = NSBundle.mainBundle().infoDictionary?[kCFBundleNameKey as String] as? String {
            let titleLabel = UILabel()
            titleLabel.textAlignment = .Center
            titleLabel.text = appName
            titleLabel.font = Style.sharedInstance.font(Fonts.Sizes.large, bold: true, italic: false)
            titleLabel.textColor = Style.sharedInstance.foregroundColor
            let titleContainer = ContainerView(contentView: titleLabel)
            contentView.addSubview(titleContainer)
        }
        
        userField = StringField(name: kUser, label: NSLocalizedString("User", comment: ""), required: true, value: user)
        userField.field.autocorrectionType = .No
        userField.field.autocapitalizationType = .None
        userField.field.keyboardType = .EmailAddress
        contentView.addSubview(userField)
        
        passwordField = StringField(name: kPass, label: NSLocalizedString("Password", comment: ""), required: true, value: nil)
        passwordField.field.secureTextEntry = true
        contentView.addSubview(passwordField)
        
        let submitButton = UIButton(type: .Custom)
        submitButton.titleLabel?.font = Style.sharedInstance.font
        submitButton.setTitleColor(Style.sharedInstance.foregroundColor, forState: .Normal)
        submitButton.setTitleColor(Style.sharedInstance.selectedColor, forState: .Highlighted)
        submitButton.setTitle(NSLocalizedString("Submit", comment: ""), forState: .Normal)
        submitButton.addTarget(self, action: #selector(submitAction), forControlEvents: .TouchUpInside)
        
        let buttonContainer = ContainerView(contentView: submitButton)
        buttonContainer.contentInsets.top = Dimens.Margins.xlarge
        contentView.addSubview(buttonContainer)
        
        updateViewConstraints()
        
        retrieveResponders()
    }
    
    func submitAction() {
        
        view.endEditing(true)
        
        if userField.valid() && passwordField.valid() {
            var jsonValues: [String: AnyObject] = [:]
            if let userValue = userField.jsonValue() {
                jsonValues[userField.name] = userValue
            }
            if let passValue = passwordField.jsonValue() {
                jsonValues[passwordField.name] = passValue
            }
            submit(jsonValues)
        }
    }

    func submit(fields: [String: AnyObject]?) {
        
        if let fields = fields, user = fields[kUser] as? String, pass = fields[kPass] as? String, loginService = loginService {
            
            SVProgressHUD.show()
            loginService.login(user, password: pass, success: { [weak self] (response) in
                
                SVProgressHUD.dismiss()
                guard let strongSelf = self else { return }
                
                strongSelf.passwordField.clear()
                NSUserDefaults.standardUserDefaults().setObject(user, forKey: strongSelf.kUser)
                
                LoginManager.sharedInstance.update(response)
                
                if let mainViewController = strongSelf.mainViewController {
                    
                    mainViewController.modalTransitionStyle = .CrossDissolve
                    strongSelf.navigationController?.presentViewController(mainViewController, animated: true, completion: {
                        
                    })
                }
                
            }, failure: { [weak self] (error) in
                
                SVProgressHUD.dismiss()
                guard let strongSelf = self else { return }
                
                ErrorManager.show(error, rootController: strongSelf)
            })
        }
    }
}