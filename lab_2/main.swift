//
//  main.swift
//  lab_2
//
//  Created by HAZY on 11.02.2024.
//

import Foundation

class BankAccount {
    let accountNumber: String
    let accountOwner: String
    private var balance: Double

    private static var uniqueAccountNumbers = Set<String>()

    
    init(accountNumber: String, accountOwner: String, initialBalance: Double) {
        
        guard !BankAccount.uniqueAccountNumbers.contains(accountNumber) else {
            fatalError("Номер аккаунта должен быть уникальным.")
        }

        self.accountNumber = accountNumber
        self.accountOwner = accountOwner
        self.balance = initialBalance

        
        BankAccount.uniqueAccountNumbers.insert(accountNumber)
    }

    
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("Сумма депозита должна превышать 0.")
            return
        }

        balance += amount
        print("Депозит на сумму \(amount) был успешно внесен.")
    }

    // Method to withdraw money from the account
    func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Сумма вывода сресдтв должна превышать 0.")
            return
        }

        guard balance - amount >= 0 else {
            print("Недостаточно средств.")
            return
        }

        balance -= amount
        print("Снятие средств на сумму \(amount) было успешно завершено.")
    }

    
    func getBalance() -> Double {
        return balance
    }

    
    func displayAccountInfo() {
        print("Account Number: \(accountNumber)")
        print("Account Owner: \(accountOwner)")
        print("Current Balance: \(balance)")
    }
}


let account1 = BankAccount(accountNumber: "100012221", accountOwner: "Леонардо", initialBalance: 1000.0)
let account2 = BankAccount(accountNumber: "123321123", accountOwner: "Микелянджело", initialBalance: 150.0)
let account3 = BankAccount(accountNumber: "100238819", accountOwner: "Вася Пупкин", initialBalance: 550000.0)

account1.displayAccountInfo()
account1.deposit(amount: 500.0)

account2.displayAccountInfo()
account2.withdraw(amount: 150.0)

account3.displayAccountInfo()
account3.withdraw(amount: 0)


account1.displayAccountInfo()
account2.displayAccountInfo()
account3.displayAccountInfo()



