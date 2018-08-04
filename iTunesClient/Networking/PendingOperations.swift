//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by thechemist on 8/3/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue() 
}
