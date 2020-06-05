import UIKit

/*  1. Решить квадратное уравнение.
 Квадратное уравнение — это уравнение вида ax^2 + bx + c = 0,
 где коэффициенты a, b и c — произвольные числа, причем a ≠ 0. */

let a: Double = 2   // 2 is for example. Input your value
let b: Double = 5   // 5 is for example. Input your value
let c: Double = -7  // -7 is for example. Input your value

solveQuadraticEquation(a: a, b: b, c: c)

func solveQuadraticEquation(a: Double, b: Double, c: Double) {
    if (a != 0) {
        if (b == 0) && (c == 0) {
            print("Уравнение имеет единственный корень: x = 0.")
        } else if (b == 0) || (c == 0) {
            resultForIncompleteQuadraticEquation(a: a, b: b, c: c)
        } else {    // if (b != 0) && (c != 0)
            resultByDiscriminant(a: a, b: b, c: c)
        }
    } else {    // if (a == 0)
        print("Уравнение не имеет решений, a = 0.")
    }
}

func resultByDiscriminant(a: Double, b: Double, c: Double) {
    var discriminant: Double
    let squareB = pow (b, 2)
    let ac4 = (4.0 * a * c)
    let x1: Double
    let x2: Double
    
    discriminant = squareB - ac4
    
    if (discriminant < 0) {
        print("Дискриминант отрицательный, уравнение не имеет решений.")
    } else if (discriminant == 0) {
        x1 = ((-b + sqrt (discriminant)) / (2 * a))
        print("Дискриминант равен нулю — корень будет один, x = \(x1).")
    } else {    // if (discriminant > 0)
        x1 = ((-b + sqrt (discriminant)) / (2 * a))
        x2 = ((-b - sqrt (discriminant)) / (2 * a))
        print("Уравнение имеет два различных корня: \(x1), \(x2)")
    }
}

func resultForIncompleteQuadraticEquation(a: Double, b: Double, c: Double) {
    var x3: Double
    var x4: Double
    
    if (b == 0) {    // ax^2 + c = 0
        let divisionCbyA: Double = -(c / a)
        if (divisionCbyA >= 0) {
            x3 = -sqrt (divisionCbyA)
            x4 = sqrt (divisionCbyA)
            print("Уравнение имеет два различных корня: \(x3), \(x4)")
        } else {    // if divisionCbyA < 0
            print("Уравнение не имеет решений.")
        }
    }
        
    if (c == 0) { //ax^2 + bx = 0
        x3 = 0
        x4 = -(b / a)
        print("Уравнение имеет два различных корня: \(x3), \(x4)")
    }
}

/*  2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника ABC, C = 90.*/

let sideAC: Double = 8   // 8 is for example. Input your value
let sideBC: Double = 4   // 4 is for example. Input your value
let sideAB = findHypotenuse(sideAC: sideAC, sideBC: sideBC)

findSquarePerimeterHypotenuse(sideAC: sideAC, sideBC: sideBC)

func findSquarePerimeterHypotenuse(sideAC: Double, sideBC: Double) {
    if (sideAC > 0) && (sideBC > 0) {
        print("Площадь прямоугольного треугольника равна:", squareRightTriangle(sideAC: sideAC, sideBC: sideBC),
              "\nПериметр треугольника равен", perimeterRightTriangle(sideAC: sideAC, sideBC: sideBC, sideAB: sideAB),
              "\nГипотенуза равна", findHypotenuse(sideAC: sideAC, sideBC: sideBC))
    } else {
        print("Стороны треугольника не могут быть отрицательными или равными 0.")
    }
}

func findHypotenuse(sideAC: Double, sideBC: Double) -> Double {
    let pow2sideAC: Double = pow (sideAC, 2)
    let pow2sideBC: Double = pow (sideBC, 2)
    let sideAB: Double = sqrt(pow2sideAC + pow2sideBC)
    let roundSideAB = Double(round(100*sideAB)/100)
    return roundSideAB
}

func perimeterRightTriangle(sideAC: Double, sideBC: Double, sideAB: Double) -> Double{
    let perimeter: Double = sideAC + sideBC + sideAB
    let roundPerimeter = Double(round(100*perimeter)/100)
    return roundPerimeter
}

func squareRightTriangle(sideAC: Double, sideBC: Double) -> Double{
    let square: Double = sideAC * sideBC * 0.5
    let roundSquare = Double(round(100*square)/100)
    return roundSquare
}

/*  3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет. */

var summ: Double = 1000   // 1000 is for example. Input your value
var percent: Double = 9   // 9 is for example. Input your value
var years: Int = 5        // 5 is for example. Input your value

let depositResult = deposit(summ: summ, percent: percent, years: years)
print ("Cумма вклада через 5 лет:", depositResult)

func deposit(summ: Double, percent: Double, years: Int) -> Double {
    let newPercent = percent / 100
    var newSumm = summ
    let newYears = years
    
    for _ in 1...newYears {
        newSumm = newSumm + ( newSumm * newPercent)
    }
    
    newSumm = Double(round(100*newSumm)/100)
    return newSumm
}





