//
//  MenuItem0ViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class MenuItem0ViewController: TableViewController<Screen0DSItem>, UITableViewDataSource, UITableViewDelegate {
    
    typealias Cell = DetailImageCell
    
    override init() {
        super.init()
		
		datasource = DatasourceManager.sharedInstance.Screen0DS
		
		dataResponse = self
		
		behaviors.append(FilterBehavior<MenuItem0FilterViewController>(viewController: self))
		behaviors.append(SearchBehavior(viewController: self))
		behaviors.append(CreateBehavior<MenuItem0FormViewController, Screen0DSItem>(viewController: self))
		// behaviors.append(DeleteBehavior(dataViewController: self))
			
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnalyticsManager.sharedInstance?.analytics?.logPage("Auto 2")
        title = NSLocalizedString("Auto 2", comment: "")

        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Cell.self, forCellReuseIdentifier: Cell.identifier)

        updateViewConstraints()
		
        loadData()		
    }
    
	//MARK: - <UITableViewDataSource>
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
	
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier(Cell.identifier, forIndexPath: indexPath) as! Cell

		// You can customize the accessory icon ...
        let icon = UIImage(named: Images.arrow)?.imageWithRenderingMode(.AlwaysTemplate)
        let accessoryImageView = UIImageView(image: icon)
        accessoryImageView.tintColor = Style.sharedInstance.foregroundColor
        cell.accessoryView = accessoryImageView
	
        
        
        // Binding 
        let item = items[indexPath.row]
			
		 
        cell.photoImageView.loadImage(datasource.imagePath(item.picture))
		cell.titleLabel.text = item.name
		cell.detailLabel.text = item.phone
		
		// Styles
		
		cell.titleLabel.font = Style.sharedInstance.font(Fonts.Sizes.medium, bold: true, italic: false)
		
		return cell
    }

	 //MARK: - <UITableViewDelegate>
	 
	
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let destinationViewController = MenuItem0DetailViewController()
        destinationViewController.item = items[indexPath.row]
        destinationViewController.datasource = datasource
        
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
	
	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        loadMoreData(indexPath.row)
		
		cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
    }

}

//MARK: - <DataResponse>

extension MenuItem0ViewController: DataResponse {

    func success() {
        
        tableView.reloadData()
    }
    
    func failure(error: NSError?) {
        
        ErrorManager.show(error, rootController: self)
    }
}
