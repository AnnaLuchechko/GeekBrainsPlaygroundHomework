import UIKit

/*   1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
     2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
     3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
     4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
     5. Создать несколько объектов каждого класса. Применить к ним различные действия.
     6. Вывести значения свойств экземпляров в консоль. */

class Car {
    var color: Color
    let manufacturer: Manufacturer
    let transmission: Transmission
    let yearOfManufacture: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    
    func execute(action: CarActions) {
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
    
    func carDescription() {
        print("Цвет кузова: \(color.rawValue)\n" +
            "изготовитель: \(manufacturer)\n" +
            "трансмиссия: \(transmission.rawValue)\n" +
            "год производства: \(yearOfManufacture)\n" +
            "двигатель: \(engineRunning ? "включен" : "нет")\n" +
            "окна: \(windowsOpen ? "открыты" : "закрыты")\n" +
            "-----------------------------------------------")
    }
    
    init(color: Color, manufacturer: Manufacturer, yearOfManufacture: Int, transmission: Transmission, engineRunning: Bool, windowsOpen: Bool) {
        self.color = color
        self.manufacturer = manufacturer
        self.transmission = transmission
        self.yearOfManufacture = yearOfManufacture
        self.engineRunning = engineRunning
        self.windowsOpen = windowsOpen
    }
}

class TrunkCar: Car {
    var trailerConnected: Bool
    let trunkVolume: Double
    var trunkLoad: Double = 0
    
   init(color: Color, manufacturer: Manufacturer, yearOfManufacture: Int, transmission: Transmission, engineRunning: Bool, windowsOpen: Bool, trunkVolume: Double, trailerConnected: Bool, trunkLoad: Double) {
        self.trailerConnected = trailerConnected
        self.trunkVolume = trunkVolume
        self.trunkLoad = trunkLoad
        super.init(color: color, manufacturer: manufacturer, yearOfManufacture: yearOfManufacture, transmission: transmission, engineRunning: engineRunning, windowsOpen: windowsOpen)
    }
    
    override func execute(action: CarActions) {
        super.execute(action: action)
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
    
    override func carDescription() {
        super.carDescription()
        print("Прицеп подключен: \(trailerConnected ? "Да" : "Нет")\n" +
            "Обьем кузова: \(trunkVolume)\n" +
            "Кузов загружен на \(trunkLoad) кг!\n" +
            "-----------------------------------------------")
    }
    
    
}

class SportCar: Car {
    var topSpeed: Int
    var spoilerShown: Bool
    var launchControlEnabled: Bool
    
    init(color: Color, manufacturer: Manufacturer, yearOfManufacture: Int, transmission: Transmission, engineRunning: Bool, windowsOpen: Bool, topSpeed: Int, spoilerShown: Bool, launchControlEnabled: Bool) {
        self.topSpeed = topSpeed
        self.spoilerShown = spoilerShown
        self.launchControlEnabled = launchControlEnabled
        super.init(color: color, manufacturer: manufacturer, yearOfManufacture: yearOfManufacture, transmission: transmission, engineRunning: engineRunning, windowsOpen: windowsOpen)
    }
    
    override func execute(action: CarActions) {
        super.execute(action: action)
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
    
    override func carDescription() {
        super.carDescription()
        print("Максимальная скорость: \(topSpeed) км/час\n" +
            "Спойлер: \(spoilerShown ? "поднят" : "опущен")\n" +
            "Контроль запуска: \(launchControlEnabled ? "включен" : "выключен")\n" +
            "-----------------------------------------------")
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


var volvoTrunkCar: TrunkCar = TrunkCar(color: .white, manufacturer: .volvo, yearOfManufacture: 2010, transmission: .automatic, engineRunning: false, windowsOpen: true, trunkVolume: 24000, trailerConnected: true, trunkLoad: 15000)
volvoTrunkCar.execute(action: .disconnectTrailer)
volvoTrunkCar.execute(action: .loadTrunk(weight: 4999))
volvoTrunkCar.execute(action: .engineStop)
volvoTrunkCar.execute(action: .windowsOpen)
volvoTrunkCar.carDescription()

var porscheSportCar: SportCar = SportCar(color: .yellow, manufacturer: .porsche, yearOfManufacture: 2020, transmission: .manual, engineRunning: true, windowsOpen: false, topSpeed: 345, spoilerShown: true, launchControlEnabled: false)
porscheSportCar.execute(action: .spoilerShow)
porscheSportCar.execute(action: .enableLaunchControl)
porscheSportCar.execute(action: .engineStop)
porscheSportCar.execute(action: .windowsOpen)
porscheSportCar.carDescription()
