//
//  CategoriesViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class CategoriesViewController: UITableViewController {
    
    typealias Cell = BasicImageCell
    
    var items: [MenuItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Style.sharedInstance.backgroundColor

        AnalyticsManager.sharedInstance?.analytics?.logPage("Categories")
        
		
        items = [
			MenuItem(text: "AUTO",
                action: NavigationAction<Screen0ViewController>(rootViewController: self),
				image: "location1png724",
				textStyle: TextStyle(alignment: .Left)
            ),
			MenuItem(text: "AUTO",
                action: NavigationAction<MenuItem0ViewController>(rootViewController: self),
				image: "location1png724",
				textStyle: TextStyle(alignment: .Left)
            ),
			MenuItem(text: "GYMS",
                action: NavigationAction<GymsScreen1ViewController>(rootViewController: self),
				image: "location2png448",
				textStyle: TextStyle(alignment: .Left)
            ),
			MenuItem(text: "GYMS",
                action: NavigationAction<GymsViewController>(rootViewController: self),
				image: "location2png448",
				textStyle: TextStyle(alignment: .Left)
            ),
			MenuItem(text: "LAWYERS",
                action: NavigationAction<LawyersViewController>(rootViewController: self),
				image: "location3png95",
				textStyle: TextStyle(alignment: .Left)
            ),
			MenuItem(text: "RESTAURANTS",
                action: NavigationAction<RestaurantsViewController>(rootViewController: self),
				image: "location4png555",
				textStyle: TextStyle(alignment: .Left)
            ),
		
        ]
        
        tableView.registerClass(Cell.self, forCellReuseIdentifier: Cell.identifier)
    }
    
    func configure(cell: Cell, indexPath: NSIndexPath) {
    
        let item = items[indexPath.row]
        cell.titleLabel.textColor = item.textStyle?.color
        cell.titleLabel.font = item.textStyle?.font
        cell.titleLabel.text = item.text

		cell.photoImageView.loadImage(item.image)
        cell.userInteractionEnabled = false
        cell.accessoryView = nil
        cell.accessoryType = .None
        if let action = item.action where action.canBeExecuted() {
            
            cell.userInteractionEnabled = true

            // You can customize the accessory icon ...
            let icon = UIImage(named: Images.arrow)?.imageWithRenderingMode(.AlwaysTemplate)
            let accessoryImageView = UIImageView(image: icon)
            accessoryImageView.tintColor = Style.sharedInstance.foregroundColor
            cell.accessoryView = accessoryImageView
        }
    }
    
    //MARK: - <UITableViewDataSource>
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Cell.identifier, forIndexPath: indexPath) as! Cell
        
        configure(cell, indexPath: indexPath)
        
        return cell
    }
    
    //MARK: - <UITableViewDelegate>
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item = items[indexPath.row]
        item.action?.execute()
    }
}
