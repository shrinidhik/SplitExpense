//
//  AddBalanceVC.swift
//  Coding11
//
//  Created by Shrinidhi on 14/03/24.
//

import UIKit

class AddBalanceVC: UIViewController {

    @IBOutlet weak var participantsStackView: UIStackView!
    @IBOutlet weak var paidByTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var expenseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        expenseTextField.layer.borderColor = UIColor.black.cgColor
        expenseTextField.layer.borderWidth = 1
        amountTextField.layer.borderColor = UIColor.black.cgColor
        amountTextField.layer.borderWidth = 1
        paidByTextField.layer.borderColor = UIColor.black.cgColor
        paidByTextField.layer.borderWidth = 1

    }
                      
    @IBAction func didPressAddExpenseButton(_ sender: Any) {
        let paidUserIndex = DataSource.shared.users.firstIndex(where: { $0.name == paidByTextField.text })
        var paidUser: User
        if let paidUserIndex = paidUserIndex {
            paidUser = DataSource.shared.users[paidUserIndex]
        } else {
            paidUser = User(name: paidByTextField.text ?? "")
        }
        let expenseAmount: Double = Double(amountTextField.text ?? "") ?? 0.0
        var expense = Expense(amount: expenseAmount, name: expenseTextField.text ?? "", paidBy: paidUser)
        paidUser.paidExpnses.append(expense)
        
        let participants = getParticipants()
        participants.forEach { participant in
            
            let participatedUserIndex = DataSource.shared.users.firstIndex(where: { $0.name == participant })
            var participatedUser: User
            if let participatedUserIndex =  participatedUserIndex {
                participatedUser = DataSource.shared.users[participatedUserIndex]
                participatedUser.participatedExpenses.append(expense)
                DataSource.shared.users[participatedUserIndex] = participatedUser
            } else {
                participatedUser = User(name: participant)
                participatedUser.participatedExpenses.append(expense)
                DataSource.shared.users.append(participatedUser)
            }
            expense.participants.append(participatedUser)
        }
        
        if let paidUserIndex = paidUserIndex  {
            DataSource.shared.users[paidUserIndex] = paidUser
        } else {
            DataSource.shared.users.append(paidUser)
        }
        DataSource.shared.expenses.append(expense)
        
    }
    
    @IBAction func didpressAddButton(_ sender: Any) {
        participantsStackView.addArrangedSubview(getTextField())
    }
    
    func getTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = UIColor.black
        textField.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        return textField
    }
    
    func getParticipants() -> [String] {
        var textFields: [UITextField] = []
        participantsStackView.arrangedSubviews.forEach {
            if let textfield = $0 as? UITextField {
                textFields.append(textfield)
            }
        }
        let users = textFields.map { $0.text ?? ""}
        return users
    }

}
