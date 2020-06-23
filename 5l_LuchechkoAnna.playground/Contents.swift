import UIKit

/*   1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
     2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
     3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
     4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
     5. Создать несколько объектов каждого класса. Применить к ним различные действия.
     6. Вывести сами объекты в консоль. */

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

enum Transmission: String {
    case manual = "ручная"
    case automatic = "автомат"
    case robot = "робот"
    case variator = "вариатор"
    case tiptronic = "типтроник"
}

enum CarActions {
    case engineStart, engineStop, windowsOpen, windowsClose
    case loadTrunk (weight: Double), unloadTrunk (weight: Double)
    case connectTrailer, disconnectTrailer
    case spoilerShow, spoilerHide
    case enableLaunchControl, disableLaunchCotrol
}

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

class SportCar: Car {
    var color: Color
    var manufacturer: Manufacturer
    var transmission: Transmission
    var yearOfManufacture: Int = 0
    var engineRunning: Bool
    var windowsOpen: Bool
    var topSpeed: Int
    var spoilerShown: Bool
    var launchControlEnabled: Bool

    func execute(action: CarActions) {
        switch action {
        case .spoilerShow:
            guard !spoilerShown else { print ("Ошибка! Спойлер \(manufacturer) уже поднят!"); return }
            spoilerShown = true
            print ("Спойлер \(manufacturer) поднят!")
        case .spoilerHide:
            guard spoilerShown else { print ("Ошибка! Спойлер \(manufacturer) уже опущен!"); return }
            spoilerShown = false
            print ("Спойлер \(manufacturer) опущен!")
        case .enableLaunchControl:
            guard !launchControlEnabled else { print ("Ошибка! Контроль запуска \(manufacturer) уже включен!"); return }
            launchControlEnabled = true
            print ("Контроль запуска \(manufacturer) включен!")
        case .disableLaunchCotrol:
            guard launchControlEnabled else { print ("Ошибка! Контроль запуска \(manufacturer) уже выключен!"); return }
            launchControlEnabled = false
            print ("Контроль запуска \(manufacturer) выключен!")
        default :
            return
        }
    }
    
    init(color: Color, manufacturer: Manufacturer, yearOfManufacture: Int, transmission: Transmission, engineRunning: Bool, windowsOpen: Bool, topSpeed: Int, spoilerShown: Bool, launchControlEnabled: Bool) {
        self.color = color
        self.manufacturer = manufacturer
        self.transmission = transmission
        self.yearOfManufacture = yearOfManufacture
        self.engineRunning = engineRunning
        self.windowsOpen = windowsOpen
        self.topSpeed = topSpeed
        self.spoilerShown = spoilerShown
        self.launchControlEnabled = launchControlEnabled
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Максимальная скорость: \(topSpeed) км/час\n" +
        "Спойлер: \(spoilerShown ? "поднят" : "опущен")\n" +
        "Контроль запуска: \(launchControlEnabled ? "включен" : "выключен")\n" +
        "-----------------------------------------------"
    }
}

class TrunkCar: Car {
    var color: Color
    var manufacturer: Manufacturer
    var transmission: Transmission
    var yearOfManufacture: Int = 0
    var engineRunning: Bool
    var windowsOpen: Bool
    var trailerConnected: Bool
    let trunkVolume: Double
    var trunkLoad: Double = 0
    

    
    func execute(action: CarActions) {
        switch action {
        case .connectTrailer:
            guard !trailerConnected else { print ("Ошибка! Прицеп \(manufacturer) уже подключен!"); return }
            trailerConnected = true
            print ("Прицеп \(manufacturer) подключен!")
        case .disconnectTrailer:
            guard trailerConnected else { print ("Ошибка! Прицеп \(manufacturer) не подключен!"); return }
            trailerConnected = false
            print ("Прицеп \(manufacturer) отключен!")
        case let .loadTrunk(weight):
            guard trunkVolume > (trunkLoad + weight) else { print ("Ошибка! Объем кузова \(manufacturer) превышен!"); return }
            trunkLoad += weight
            print ("Успешно погружено \(weight) кг в \(manufacturer)!")
        case let .unloadTrunk(weight):
            guard (trunkLoad - weight) > 0 else { print ("Ошибка! Кузов \(manufacturer) уже пуст!"); return }
            trunkLoad -= weight
            print ("Успешно выгружено \(weight) кг из \(manufacturer)!")
        default:
            return
        }
    }
    
    init(color: Color, manufacturer: Manufacturer, yearOfManufacture: Int, transmission: Transmission, engineRunning: Bool, windowsOpen: Bool, trunkVolume: Double, trailerConnected: Bool, trunkLoad: Double) {
        self.color = color
        self.manufacturer = manufacturer
        self.transmission = transmission
        self.yearOfManufacture = yearOfManufacture
        self.engineRunning = engineRunning
        self.windowsOpen = windowsOpen
        self.trailerConnected = trailerConnected
        self.trunkVolume = trunkVolume
        self.trunkLoad = trunkLoad
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Прицеп подключен: \(trailerConnected ? "Да" : "Нет")\n" +
        "Обьем кузова: \(trunkVolume)\n" +
        "Кузов загружен на \(trunkLoad) кг!\n" +
        "-----------------------------------------------"
    }
}

var volvoTrunkCar: TrunkCar = TrunkCar(color: .white, manufacturer: .volvo, yearOfManufacture: 2010, transmission: .automatic, engineRunning: false, windowsOpen: true, trunkVolume: 24000, trailerConnected: true, trunkLoad: 15000)
volvoTrunkCar.execute(action: .disconnectTrailer)
volvoTrunkCar.execute(action: .loadTrunk(weight: 4999))
volvoTrunkCar.execute(action: .engineStop)
volvoTrunkCar.execute(action: .windowsOpen)
print(volvoTrunkCar.description)

var porscheSportCar: SportCar = SportCar(color: .yellow, manufacturer: .porsche, yearOfManufacture: 2020, transmission: .manual, engineRunning: true, windowsOpen: false, topSpeed: 345, spoilerShown: true, launchControlEnabled: false)
porscheSportCar.execute(action: .spoilerShow)
porscheSportCar.execute(action: .enableLaunchControl)
porscheSportCar.execute(action: .engineStop)
porscheSportCar.execute(action: .windowsOpen)
print(porscheSportCar.description)
