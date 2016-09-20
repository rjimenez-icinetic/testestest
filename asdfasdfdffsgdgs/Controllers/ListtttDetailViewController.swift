//
//  ListtttDetailViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class ListtttDetailViewController: DataViewController<AaaaaaaDSItem> {
    
    var didSetupConstraints = false
   
	var titleLabel1: UILabel!
	var titleLabel2: UILabel!
	var imageUrl3: UIImageView!
	var titleLabel4: UILabel!
	

	override init() {
        super.init()
        
        datasource = DatasourceManager.sharedInstance.AaaaaaaDS
        
        dataResponse = self

		behaviors.append(ShareBehavior(dataViewController: self))
		behaviors.append(UpdateBehavior<ListtttFormViewController, AaaaaaaDSItem>(dataViewController: self))
		behaviors.append(DeleteBehavior(dataViewController: self))
	
    }
	
	override func viewDidLoad() {
        super.viewDidLoad()

		
		titleLabel1 = createLabel()
		addSubview(titleLabel1)	
		
		titleLabel2 = createLabel()
		addSubview(titleLabel2)	
		
		imageUrl3 = createImageView()
		addSubview(imageUrl3)	
		
		titleLabel4 = createLabel()
		addSubview(titleLabel4)	
		
	
		updateViewConstraints()
		
		loadData()
	}
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            
            didSetupConstraints = true
            setupConstraints()
        }
        super.updateViewConstraints()
    }

	func setupConstraints() {
        
        let views:[String: UIView] = [
            "scrollView": scrollView,
            "contentView": contentView,
			"titleLabel1": titleLabel1,
			"titleLabel2": titleLabel2,
			"imageUrl3": imageUrl3,
			"titleLabel4": titleLabel4,
        ]
        
        let metrics:[String: CGFloat] = [
            "zero": Dimens.Margins.none,
            "margin": Dimens.Margins.large,
            "buttonSize": Dimens.Sizes.small
        ]
		
		contentView.removeConstraints(contentConstraints)
        scrollView.removeConstraints(scrollConstraints)
        view.removeConstraints(mainConstraints)
		
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		mainConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        mainConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
		contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(==scrollView)]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        scrollConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contentView]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
			
		titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel1]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel2]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		imageUrl3.translatesAutoresizingMaskIntoConstraints = false
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageUrl3]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        contentConstraints.append(NSLayoutConstraint(item: imageUrl3,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0))
		titleLabel4.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel4]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[titleLabel1]-margin-[titleLabel2]-margin-[imageUrl3]-margin-[titleLabel4]-(>=margin)-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))

		view.addConstraints(mainConstraints)
        contentView.addConstraints(contentConstraints)
        scrollView.addConstraints(scrollConstraints)
	}
}

extension ListtttDetailViewController: DataResponse {

    func success() {
        
        title = ""
        
 		titleLabel1.text = item?.text1
		
		titleLabel2.text = item?.text2
		
		imageUrl3.loadImage(datasource.imagePath(item?.picture), containerView: view)
		
		titleLabel4.text = item?.text3
		
       
    }
    
    func failure(error: NSError?) {
        ErrorManager.show(error, rootController: self)
    }
}

