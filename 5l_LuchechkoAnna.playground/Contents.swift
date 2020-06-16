import UIKit

/*   1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
     2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
     3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
     4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
     5. Создать несколько объектов каждого класса. Применить к ним различные действия.
     6. Вывести сами объекты в консоль. */

protocol Car {
    var color: Color { get set }
    var manufacturer: Manufacturer { get set }
    var transmission: Transmission { get set }
    var yearOfManufacture: Int { get set }
    var engineRunning: Bool { get set }
    var windowsOpen: Bool { get set }
    func execute(action: CarActions)
}

extension Car {
    mutating func execute(action: CarActions) {
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
        default:
            return
        }
    }
}

enum Color: String {
    case white = "белый"
    case red = "красный"
    case black = "черный"
    case yellow = "желтый"
    case blue = "синий"
    case green = "зеленый"
    case gray = "серый"
}

enum Manufacturer {
    case porsche, bmw, mercedes, audi, mazda, honda, tesla, volvo
}

enum CarActions {
    case engineStart, engineStop, windowsOpen, windowsClose
    case loadTrunk (weight: Double), unloadTrunk (weight: Double)
    case connectTrailer, disconnectTrailer
    case spoilerShow, spoilerHide
    case enableLaunchControl, disableLaunchCotrol
}

enum Transmission: String {
    case manual = "ручная"
    case automatic = "автомат"
    case robot = "робот"
    case variator = "вариатор"
    case tiptronic = "типтроник"
}
