//
//  Screen0DetailViewController.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import UIKit

class Screen0DetailViewController: DataViewController<Screen0DSItem> {
    
    var didSetupConstraints = false
   
	var imageUrl1Header: UILabel!
	var imageUrl1: UIImageView!
	var titleLabel2: UILabel!
	var titleLabel3Header: UILabel!
	var titleLabel3: UILabel!
	var titleLabel3Button: UIButton!
	
	var titleLabel4Header: UILabel!
	var titleLabel4: UILabel!
	var titleLabel4Button: UIButton!
	
	var titleLabel5Header: UILabel!
	var titleLabel5: UILabel!
	var titleLabel5Button: UIButton!
	
	

	override init() {
        super.init()
        
        datasource = DatasourceManager.sharedInstance.Screen0DS
        
        dataResponse = self

	
    }
	
	override func viewDidLoad() {
        super.viewDidLoad()

		
		imageUrl1Header = createHeaderLabel("Picture")
		addSubview(imageUrl1Header)	
		
		imageUrl1 = createImageView()
		addSubview(imageUrl1)	
		
		titleLabel2 = createLabel()
		addSubview(titleLabel2)	
		
		titleLabel3Header = createHeaderLabel("Phone")
		addSubview(titleLabel3Header)	
		
		titleLabel3 = createLabel()
		addSubview(titleLabel3)	
		
		titleLabel3Button = createButton(Images.phone)
        addSubview(titleLabel3Button)
		 
		titleLabel4Header = createHeaderLabel("Email")
		addSubview(titleLabel4Header)	
		
		titleLabel4 = createLabel()
		addSubview(titleLabel4)	
		
		titleLabel4Button = createButton(Images.email)
        addSubview(titleLabel4Button)
		 
		titleLabel5Header = createHeaderLabel("Address")
		addSubview(titleLabel5Header)	
		
		titleLabel5 = createLabel()
		addSubview(titleLabel5)	
		
		titleLabel5Button = createButton(Images.location)
        addSubview(titleLabel5Button)
		 
	
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
			"imageUrl1Header": imageUrl1Header, 
			"imageUrl1": imageUrl1,
			"titleLabel2": titleLabel2,
			"titleLabel3Header": titleLabel3Header, 
			"titleLabel3": titleLabel3,
			"titleLabel3Button": titleLabel3Button,
			"titleLabel4Header": titleLabel4Header, 
			"titleLabel4": titleLabel4,
			"titleLabel4Button": titleLabel4Button,
			"titleLabel5Header": titleLabel5Header, 
			"titleLabel5": titleLabel5,
			"titleLabel5Button": titleLabel5Button,
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
			
		imageUrl1Header.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[imageUrl1Header]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
			
		imageUrl1.translatesAutoresizingMaskIntoConstraints = false
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageUrl1]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        contentConstraints.append(NSLayoutConstraint(item: imageUrl1,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0))
		titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel2]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel3Header.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel3Header]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
			
		titleLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel3]-margin-[titleLabel3Button(buttonSize)]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel3Button.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[titleLabel3Button(buttonSize)]",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		contentConstraints.append(NSLayoutConstraint(item: titleLabel3Button,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: titleLabel3,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0))
			
		titleLabel4Header.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel4Header]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
			
		titleLabel4.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel4]-margin-[titleLabel4Button(buttonSize)]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel4Button.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[titleLabel4Button(buttonSize)]",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		contentConstraints.append(NSLayoutConstraint(item: titleLabel4Button,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: titleLabel4,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0))
			
		titleLabel5Header.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel5Header]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
			
		titleLabel5.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[titleLabel5]-margin-[titleLabel5Button(buttonSize)]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		titleLabel5Button.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[titleLabel5Button(buttonSize)]",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		contentConstraints.append(NSLayoutConstraint(item: titleLabel5Button,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: titleLabel5,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0))
			
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[imageUrl1Header]-margin-[imageUrl1]-margin-[titleLabel2]-margin-[titleLabel3Header]-margin-[titleLabel3]-margin-[titleLabel4Header]-margin-[titleLabel4]-margin-[titleLabel5Header]-margin-[titleLabel5]-(>=margin)-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))

		view.addConstraints(mainConstraints)
        contentView.addConstraints(contentConstraints)
        scrollView.addConstraints(scrollConstraints)
	}
}

extension Screen0DetailViewController: DataResponse {

    func success() {
        
        title = item?.name
        
 		imageUrl1.loadImage(datasource.imagePath(item?.picture), containerView: view)
		
		titleLabel2.text = item?.description
		
		titleLabel3.text = item?.phone
		
		setAction(PhoneAction(uri: item?.phone), view: titleLabel3Button)
		 
		titleLabel4.text = item?.email
		
		setAction(MailAction(recipient: item?.email), view: titleLabel4Button)
		 
		titleLabel5.text = item?.address
		
		setAction(MapAction(uri: String(geoPoint: item?.location)), view: titleLabel5Button)
		 
       
    }
    
    func failure(error: NSError?) {
        ErrorManager.show(error, rootController: self)
    }
}

