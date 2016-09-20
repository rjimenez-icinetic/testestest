//
//  DataSetViewController.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 21/8/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import UIKit

class DataSetViewController<T>: UIViewController, DataDelegate {

    var behaviors: [Behavior] = []
    
    var items: [T] = []
    
    var datasource: Datasource!
    
    var datasourceOptions: DatasourceOptions!
    
    var pageNumber = 0
    
    var loadMore = false
    
    var indicatorView: UIActivityIndicatorView?
    
    var dataResponse: DataResponse?

    lazy var datasourceSync: DatasouceSync? = {
        [unowned self] in
        return self.datasource as? DatasouceSync
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        datasourceOptions = DatasourceOptions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        datasourceOptions = DatasourceOptions()
    }
    
    deinit {
        
        if let _ = datasourceSync {
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorView = UIActivityIndicatorView(frame: CGRect(x: 0,
            y: 0,
            width: Double(Dimens.Sizes.large),
            height: Double(Dimens.Sizes.large)))
        indicatorView?.activityIndicatorViewStyle = .White
        indicatorView?.hidesWhenStopped = true
        view.setBackgroundView(indicatorView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for behavior in behaviors {
            behavior.appear?()
        }
        
        if let datasourceSync = datasourceSync {
        
            NSNotificationCenter.defaultCenter().addObserver(self,
                                                             selector: #selector(sync),
                                                             name: datasourceSync.syncKey(),
                                                             object: nil)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        for behavior in behaviors {
            behavior.disappear?()
        }
        
        if let _ = datasourceSync {
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sync(notification: NSNotification) {
        
        loadData()
    }
    
    func startLoading() {
    
        indicatorView?.startAnimating()
    }
    
    func stopLoading() {
    
        indicatorView?.stopAnimating()
    }
    
    //MARK: - Data
    
    func clearData() {
        
        pageNumber = 0
        loadMore = true
        items.removeAll()
    }
    
    func refreshData() {
        
        clearData()
        startLoading()
        
        if let datasourceSync = datasourceSync {
            guard let readyToLoad = datasourceSync.readyToLoad() where readyToLoad else {
                return
            }
        }
        
        datasourceOptions.skip = pageNumber
        datasource?.refreshData(datasourceOptions, success: { (response: [T]) in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                self.stopLoading()
                self.loadDataSuccess(response)
            }
            
        }, failure: { (error: NSError?) in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                self.stopLoading()
                self.loadDataFailure(error)
            }
        })
    }
    
    func loadData() {
        
        startLoading()
        
        if let datasourceSync = datasourceSync {
            guard let readyToLoad = datasourceSync.readyToLoad() where readyToLoad else {
                return
            }
        }
    
        datasourceOptions.skip = pageNumber
        datasource?.loadData(datasourceOptions, success: { (response: [T]) in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                self.stopLoading()
                self.loadDataSuccess(response)
            }
            
        }, failure: { (error: NSError?) in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                self.stopLoading()
                self.loadDataFailure(error)
            }
        })
    }
    
    func loadMoreData(index: Int) {
        
        if loadMore && index == items.count - 1 {
            
            loadData()
        }
    }
    
    func loadDataSuccess(response: [T]) {
        
        if response.count != 0 {
            
            pageNumber = pageNumber + 1
            
            items.appendContentsOf(response)
            
            loadMore = items.count % datasourceOptions.limit == 0
            
        } else {
            
            loadMore = false
        }
        
        dataResponse?.success()
    }
    
    func loadDataFailure(error: NSError?) {
        
        dataResponse?.failure(error)
    }
}
