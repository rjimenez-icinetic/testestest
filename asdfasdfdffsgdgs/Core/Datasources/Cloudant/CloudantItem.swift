//
//  CloudantItem.swift
//  ReferenceApp
//
//  Created by Víctor Jordán Rosado on 29/8/16.
//  Copyright © 2016 Icinetic S.L. All rights reserved.
//

import Foundation
import CDTDatastore

public protocol CloudantItem: Item {
    
    var revision: CDTDocumentRevision? { get }
    
    init?(revision: CDTDocumentRevision)
}