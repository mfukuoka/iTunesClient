//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by thechemist on 8/3/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
