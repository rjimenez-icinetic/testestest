//
//  MainNavigation.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//
 
import Foundation
import SlideMenuControllerSwift

class MainNavigation {

    var rootViewController: UIViewController!
    
    lazy var slideMenuController: SlideMenuController! = {
        
        let mainViewController = CategoriesViewController()
        mainViewController.addLeftBarButtonWithImage(UIImage(named: Images.navMenu)!)
        let mainNavigationController = UINavigationController(rootViewController: mainViewController)
        
        let menuViewController = MainMenuViewController()
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        
        return SlideMenuController(mainViewController: mainNavigationController, leftMenuViewController: menuNavigationController)
    }()

    var loginViewController: LoginViewController?
    
    init() {
        
        loginViewController = LoginViewController()
        loginViewController!.loginService = BasicAuthLoginService(appId: "cdd70125-9a6c-43df-8633-6d3f2674a870")
        loginViewController!.mainViewController = slideMenuController
        
        rootViewController = UINavigationController(rootViewController: loginViewController!)
    }
    
    func logout() {
    
        if let loginViewController = loginViewController, mainViewController = loginViewController.mainViewController {
            
            LoginManager.sharedInstance.reset()
            
            mainViewController.dismissViewControllerAnimated(true, completion: {
            
                self.slideMenuController = nil
                loginViewController.mainViewController = self.slideMenuController
            })
        }
    }
		
}
