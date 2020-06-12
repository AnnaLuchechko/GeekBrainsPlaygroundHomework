import UIKit

/*  1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
    2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
    6. Вывести значения свойств экземпляров в консоль.  */

struct Car {
    let manufacturer: Manufacturer
    let yearOfManufacture: Int
    let trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var trunkLoad: Double
    
    mutating func execute(action: VehicleActions) {
        switch action {
        case .engineStart:
            guard !engineRunning else { print ("Ошибка! Двигатель \(manufacturer) уже запущен!"); return }
            engineRunning = true
            print ("Двигатель \(manufacturer) запущен!")
        case .engineStop:
            guard engineRunning else { print ("Ошибка! Двигатель \(manufacturer) не запущен!"); return }
            engineRunning = false
            print ("Двигатель \(manufacturer) заглушен!")
            
        case .windowsOpen:
            guard !windowsOpen else { print ("Ошибка! Окна \(manufacturer) уже открыты!"); return }
            windowsOpen = true
            print ("Окна \(manufacturer) открыты!")
        case .windowsClose:
            guard windowsOpen else { print ("Ошибка! Окна \(manufacturer) уже закрыты!"); return }
            engineRunning = false
            print ("Окна \(manufacturer) закрыты!")
            
        case let .loadTrunk(weight):
            guard trunkVolume > (trunkLoad + weight) else { print ("Ошибка! Объем багажника \(manufacturer) превышен!"); return }
            trunkLoad += weight
            print ("Успешно погружено \(weight) кг из \(manufacturer)!")
        case let .unloadTrunk(weight):
            guard (trunkLoad - weight) > 0 else { print ("Ошибка! Багажник \(manufacturer) уже пуст!"); return }
            trunkLoad -= weight
            print ("Успешно выгружено \(weight) кг из \(manufacturer)!")
        }
    }
}


struct Truck {
    let manufacturer: Manufacturer
    let yearOfManufacture: Int
    let trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var trunkLoad: Double
    
    mutating func execute(action: VehicleActions) {
        switch action {
        case .engineStart:
            guard !engineRunning else { print ("Ошибка! Двигатель \(manufacturer) уже запущен!"); return }
            engineRunning = true
            print ("Двигатель \(manufacturer) запущен!")
        case .engineStop:
            guard engineRunning else { print ("Ошибка! Двигатель \(manufacturer) не запущен!"); return }
            engineRunning = false
            print ("Двигатель \(manufacturer) заглушен!")
            
        case .windowsOpen:
            guard !windowsOpen else { print ("Ошибка! Окна \(manufacturer) уже открыты!"); return }
            windowsOpen = true
            print ("Окна \(manufacturer) открыты!")
        case .windowsClose:
            guard windowsOpen else { print ("Ошибка! Окна \(manufacturer) уже закрыты!"); return }
            engineRunning = false
            print ("Окна \(manufacturer) закрыты!")
            
        case let .loadTrunk(weight):
            guard trunkVolume > (trunkLoad + weight) else { print ("Ошибка! Объем кузова \(manufacturer) превышен!"); return }
            trunkLoad += weight
            print ("Успешно погружено \(weight) кг из \(manufacturer)!")
        case let .unloadTrunk(weight):
            guard (trunkLoad - weight) > 0 else { print ("Ошибка! Кузов \(manufacturer) уже пуст!"); return }
            trunkLoad -= weight
            print ("Успешно выгружено \(weight) кг из \(manufacturer)!")
        }
    }
}

enum Manufacturer {
    case bmw, mercedes, audi, mazda, honda, tesla, volvo
}

enum VehicleActions {
    case engineStart, engineStop, windowsOpen, windowsClose
    case loadTrunk (weight: Double)
    case unloadTrunk (weight: Double)
}

var mercedes = Car(manufacturer: .mercedes, yearOfManufacture: 2020, trunkVolume: 395, engineRunning: false, windowsOpen: false, trunkLoad: 0) // Mercedes Benz AMG GT 4-door 63 S 4MATIC+
var tesla = Truck(manufacturer: .tesla, yearOfManufacture: 2020, trunkVolume: 20000, engineRunning: true, windowsOpen: false, trunkLoad: 19500) // Tesla Semi

mercedes.execute(action: .engineStart)
mercedes.execute(action: .loadTrunk(weight: 500))
mercedes.execute(action: .windowsClose)
mercedes.execute(action: .unloadTrunk(weight: 300))

print("----------------------------------------")

print("Тип машины: \(type(of: mercedes))\n" +
    "Изготовитель: \(mercedes.manufacturer)\n" +
    "Год выпуска: \(mercedes.yearOfManufacture)\n" +
    "Обьем багажника: \(mercedes.trunkVolume)\n" +
    "Двигатель запущен: \(mercedes.engineRunning ? "Да" : "Нет")\n" +
    "Окна открыты: \(mercedes.windowsOpen ? "Да" : "Нет")\n" +
    "Багажник загружен на: \(mercedes.trunkLoad) кг")

print("----------------------------------------")

tesla.execute(action: .engineStart)
tesla.execute(action: .windowsOpen)
tesla.execute(action: .loadTrunk(weight: 600))
tesla.execute(action: .unloadTrunk(weight: 5000))

print("----------------------------------------")

print("Тип машины: \(type(of: tesla))\n" +
    "Изготовитель: \(tesla.manufacturer)\n" +
    "Год выпуска: \(tesla.yearOfManufacture)\n" +
    "Обьем багажника: \(tesla.trunkVolume)\n" +
    "Двигатель запущен: \(tesla.engineRunning ? "Да" : "Нет")\n" +
    "Окна открыты: \(tesla.windowsOpen ? "Да" : "Нет")\n" +
    "Багажник загружен на: \(tesla.trunkLoad) кг")

print("----------------------------------------")
