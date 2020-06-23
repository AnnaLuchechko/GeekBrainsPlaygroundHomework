import UIKit

/*  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
    2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу. */

struct Queqe<T> {
    private var array = [T]()
    
    mutating func addToQueue(_ element: T) {
        array.append(element)
    }
    
    mutating func removeFromQueue() -> T? {
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
    
    func filter(_ item: (T) -> Bool) -> [T] {
        var result = [T]()
        for element in array {
            if item(element) {
                result.append(element)
            }
        }
        return result
    }
    
    func transform<U>(_ item: (T) -> U) -> [U] {
        var result = [U]()
        for element in array {
            let transformedElement = item(element)
            result.append(transformedElement)
        }
        return result
    }
    
    subscript(index: Int) -> T? {
        guard index < array.count, index >= 0 else { return nil }
        return array[array.count - 1 - index]
    }
    
}

extension Queqe: CustomStringConvertible {
    var description: String {
        return "\(array)"
    }
}

var myQueqe = Queqe<Int>()
myQueqe.addToQueue(1)
myQueqe.addToQueue(22)
myQueqe.addToQueue(333)
myQueqe.addToQueue(444)

print(myQueqe)
print(myQueqe.removeFromQueue()!)
print(myQueqe)

print (myQueqe.filter { $0 > 100 })

print (myQueqe.transform { Double($0) })

print (myQueqe[0] as Any)
