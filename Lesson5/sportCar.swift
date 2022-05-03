//Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны
import Foundation

enum WindowState: String, CustomStringConvertible {
   case open = "окна открыты", close = "окна закрыты"
    var description: String {
        return self.rawValue
    }
}

class SportCar: CarProtocol {
    let carBrand: String
    let carType: CarType
    let carRelease: Int
    var engineStatus: Engine
    var km: Double
    
    var windowState: WindowState
    let maxspeed: Int
    static var sportCarCount = 0
    init(carBrand: String, carType: CarType, carRelease: Int, engineStatus: Engine, km: Double, windowState: WindowState, maxspeed: Int) {
        self.carBrand = carBrand
        self.carType = carType
        self.carRelease = carRelease
        self.engineStatus = engineStatus
        self.km = km
        self.windowState = windowState
        self.maxspeed = maxspeed
        SportCar.sportCarCount += 1
    }
    deinit {
        SportCar.sportCarCount -= 1
    }
    
    
    func openWindow () {
        windowState = .open
        print ("окна \(self.carBrand) открыты")
    }
    func closeWindow () {
        windowState = .close
        print ("окна \(self.carBrand) закрыты")
    }
    //определить метод действия с автомобилем в соответствии с его классом
    func CarInfo() {
        print ("максимальная скорость \(self.carBrand) составляет \(self.maxspeed) километров в час")
    }
}

//Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible

extension SportCar: CustomStringConvertible, ConsolePrintable {
    var description: String {
    return ("\(self.carType) автомобиль \(self.carBrand), \(self.carRelease) года выпуска, \(self.engineStatus), пробег: \(self.km) километров, \(self.windowState), максимальная скорость: \(self.maxspeed) км/ч")
    }
}

