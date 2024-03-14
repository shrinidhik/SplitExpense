//
//  DataSource.swift
//  Coding11
//
//  Created by Shrinidhi on 14/03/24.
//

import Foundation

class DataSource {
    static let shared = DataSource()
    
    private init() { }
    
    var users: [User] = []
    var expenses: [Expense] = []
    
}
