//
//  LawyersDetailViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class LawyersDetailViewController: DataViewController<LawyersScreen1DSItem> {
    
    var didSetupConstraints = false
   
	var titleLabel2: UILabel!
	var imageUrl3: UIImageView!
	var titleLabel4: UILabel!
	var titleLabel5: UILabel!
	var titleLabel6: UILabel!
	var titleLabel7: UILabel!
	

	override init() {
        super.init()
        
        datasource = DatasourceManager.sharedInstance.LawyersScreen1DS
        
        dataResponse = self

		behaviors.append(ShareBehavior(dataViewController: self))
		behaviors.append(DeleteBehavior(dataViewController: self))
		behaviors.append(UpdateBehavior<LawyersFormViewController, LawyersScreen1DSItem>(dataViewController: self))
	
    }
	
	override func viewDidLoad() {
        super.viewDidLoad()

		
		titleLabel2 = createLabel()
		addSubview(titleLabel2)	
		
		imageUrl3 = createImageView()
		addSubview(imageUrl3)	
		
		titleLabel4 = createLabel()
		addSubview(titleLabel4)	
		
		titleLabel5 = createLabel()
		addSubview(titleLabel5)	
		
		titleLabel6 = createLabel()
		addSubview(titleLabel6)	
		
		titleLabel7 = createLabel()
		addSubview(titleLabel7)	
		
	
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
			"titleLabel2": titleLabel2,
			"imageUrl3": imageUrl3,
			"titleLabel4": titleLabel4,
			"titleLabel5": titleLabel5,
			"titleLabel6": titleLabel6,
			"titleLabel7": titleLabel7,
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
		
		titleLabel5.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel5]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel6.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel6]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel7.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel7]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[titleLabel2]-margin-[imageUrl3]-margin-[titleLabel4]-margin-[titleLabel5]-margin-[titleLabel6]-margin-[titleLabel7]-(>=margin)-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))

		view.addConstraints(mainConstraints)
        contentView.addConstraints(contentConstraints)
        scrollView.addConstraints(scrollConstraints)
	}
}

extension LawyersDetailViewController: DataResponse {

    func success() {
        
        title = ""
        
 		titleLabel2.text = item?.description
		
		imageUrl3.loadImage(datasource.imagePath(item?.picture), containerView: view)
		
		titleLabel4.text = item?.phone
		
		titleLabel5.text = item?.email
		
		titleLabel6.text = String(geoPoint: item?.location)
		
		titleLabel7.text = item?.address
		
       
    }
    
    func failure(error: NSError?) {
        ErrorManager.show(error, rootController: self)
    }
}

