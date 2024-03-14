//
//  Expense.swift
//  Coding11
//
//  Created by Shrinidhi on 14/03/24.
//

import Foundation

struct Expense {
    var amount: Double
    var name: String
    var paidBy: User
    var participants: [User] = []
}

struct User {
    var name: String
    var paidExpnses: [Expense] = []
    var participatedExpenses: [Expense] = []
}
