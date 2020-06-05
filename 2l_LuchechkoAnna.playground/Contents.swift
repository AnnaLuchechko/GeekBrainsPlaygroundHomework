import UIKit

print("------------------------- Задание 1 -------------------------")
print("1. Написать функцию, которая определяет, четное число или нет.")

let numberA: Int = 9
let isNumberA = evenNumber(numberA: numberA)

print(isNumberA)

func evenNumber(numberA: Int) -> String {
    if numberA % 2 == 0 {
        return "Решение: Число \(numberA) — четное."
    } else {
        return "Решение: Число \(numberA) — нечетное."
    }
}

print("\n------------------------- Задание 2 -------------------------")
print("2. Написать функцию, которая определяет, делится ли число без остатка на 3.")

let numberB: Int = 12
let isNumberB = fulldividedBy3(numberB: numberB)

print(isNumberB)

func fulldividedBy3(numberB: Int) -> String {
    if numberB % 3 == 0 {
        return "Решение: Число \(numberB) делится на 3 без остатка."
    } else {
        return "Решение: Число \(numberB) не делится на 3 без остатка."
    }
}

print("\n------------------------- Задание 3 -------------------------")
print("3. Создать возрастающий массив из 100 чисел.")

let numberArray = [Int](0...100)

print(numberArray)

print("\n------------------------- Задание 4 -------------------------")
print("4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")

let filteredArray = arrayEdit(numberArray: numberArray)

print(filteredArray)

func arrayEdit(numberArray: [Int]) -> [Int] {
    let newArray = numberArray.filter {($0 % 2 != 0) && ($0 % 3 != 0)}
    return newArray
}
print("\n------------------------- Задание 5 -------------------------")
print("5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов..")

let step: Int = 100
let x1: Double = 0
let x2: Double = 1
let result = fibonacci(x1: x1, x2: x2, step: step)
print(result)

func fibonacci(x1: Double, x2: Double, step: Int) -> [Double] {
    var x1: Double = x1
    var x2: Double = x2
    var x3: Double = 0
    var fibonacciArray = [Double]()
    
    fibonacciArray.append(x1)
    fibonacciArray.append(x2)
    
    for _ in 0..<step {
        x3 = x1 + x2
        fibonacciArray.append(x3)
        x1 = x2
        x2 = x3
    }
    return fibonacciArray
}

print("\n------------------------- Задание 6 -------------------------")
print("6. * Заполнить массив из 100 элементов различными простыми числами.")

print(getSimpleNumbers(simpleCount: 100))

func getSimpleNumbers(simpleCount: Int) -> [Int] {
    var simpleArray: [Int] = [2, 3]
    var number: Int = simpleArray.last!
    var isNumberSimple: Bool = true
    
    while simpleArray.count != simpleCount {
        for index in stride(from: simpleArray.count - 1, through: 0, by: -1) {
            if number % simpleArray[index] == 0 {
                isNumberSimple = false
            }
        }
        if isNumberSimple == true {
            simpleArray.append(number)
        }
        number += 1
        isNumberSimple = true
    }
    return simpleArray
}
