//Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны
import Foundation

class TrunkCar: CarProtocol {
    let carBrand: String
    let carType: CarType
    let carRelease: Int
    var engineStatus: Engine
    var km: Double
    
    let wheelsNum: Int
    let trunkSize: Float
    var trunkLoad: Float {
        didSet {
            let newLoad = trunkLoad - oldValue
            if newLoad>0 {
                print ("В багажник догружено \(newLoad) килограмм, итоговый вес \(self.carBrand) составляет \(self.trunkLoad) килограмм")
            } else {
                let deloadCar = -newLoad
                print ("Из багажника выгружено \(deloadCar) килограмм, итоговый вес \(self.carBrand) составляет \(self.trunkLoad) килограмм")
            }
        }
    }
    static var trunkCarCount = 0
    init(carBrand: String, carType: CarType, carRelease: Int, engineStatus: Engine, km: Double, wheelsNum: Int, trunkSize: Float, trunkLoad: Float) {
        self.carBrand = carBrand
        self.carType = carType
        self.carRelease = carRelease
        self.engineStatus = engineStatus
        self.km = km
        self.wheelsNum = wheelsNum
        self.trunkSize = trunkSize
        self.trunkLoad = trunkLoad
        TrunkCar.trunkCarCount += 1
    }
    deinit {
        TrunkCar.trunkCarCount -= 1
    }
    
    //определить метод действия с автомобилем в соответствии с его классом
    func CarInfo() {
        print ("вместимость \(self.carBrand) составляет \(self.trunkSize) килограмм, текущая загрузка \(self.trunkLoad/self.trunkSize*100)%")
    }
}

//Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible
extension TrunkCar: CustomStringConvertible, ConsolePrintable {
    var description: String {
    return ("\(self.carType) автомобиль \(self.carBrand), \(self.carRelease) года выпуска, \(self.engineStatus), пробег: \(self.km) километров, количество колес: \(self.wheelsNum), вместимость багажника: \(self.trunkSize) кг, текущая загрузка багажника: \(self.trunkLoad) кг")
    }
}
