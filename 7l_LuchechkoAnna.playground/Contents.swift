import UIKit

/*  1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
    2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error. */

enum CoffeeMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class CoffeeMachine {
    private var inventory = [
        "Espresso": Item(price: 5, count: 10),
        "Americano": Item(price: 9, count: 10),
        "Cacao": Item(price: 12, count: 10)
    ]
    var coinsDeposited = 0

    func tryPrepare(_ name: String) throws {
        guard let item = inventory[name] else {
            throw CoffeeMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw CoffeeMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw CoffeeMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
    }
    
    func prepare(_ name: String) -> String {
        do {
            try tryPrepare(name)
            return "Take your \(name), Sir"
        } catch CoffeeMachineError.invalidSelection {
            return "Please enter valid item"
        } catch CoffeeMachineError.outOfStock {
            return "\(name) is not available now"
        } catch CoffeeMachineError.insufficientFunds(let coinsNeeded) {
            return "You have not enought money. \(coinsNeeded) coins needed."
        } catch {
            return error.localizedDescription
        }
    }
}

var coffeeTry: CoffeeMachine = CoffeeMachine()
coffeeTry.coinsDeposited = 12
print(coffeeTry.prepare("Cacao"))

/*---------------------------*/

class CoffeeMachineAdvanced {
    private var inventory = [
        "Espresso": Item(price: 5, count: 10),
        "Americano": Item(price: 9, count: 10),
        "Cacao": Item(price: 12, count: 10)
    ]
    var coinsDeposited = 0

    func tryPrepare(_ name: String) -> (Item?, CoffeeMachineError?) {
        guard let item = inventory[name] else {
            return (nil, CoffeeMachineError.invalidSelection)
        }

        guard item.count > 0 else {
            return (nil, CoffeeMachineError.outOfStock)
        }

        guard item.price <= coinsDeposited else {
            return (nil, CoffeeMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited))
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        return(newItem, nil)
    }
}

var coffeeTry2: CoffeeMachineAdvanced = CoffeeMachineAdvanced()
coffeeTry2.coinsDeposited = 0
print(coffeeTry2.tryPrepare("sd"))
