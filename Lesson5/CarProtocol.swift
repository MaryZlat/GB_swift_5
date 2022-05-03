//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
import Foundation

enum CarType: String, CustomStringConvertible {
    case sport = "Cпорт-кар", truck = "Грузовой", family = "Семейный SV"
    var description: String {
        return self.rawValue
    }
}
enum Engine: String, CustomStringConvertible {
    case on = "двигатель заведен", off = "двигатель не заведен"
    var description: String {
        return self.rawValue
    }
}

protocol CarProtocol {
    var carBrand: String {get}
    var carRelease: Int {get}
    var carType: CarType {get}
    var engineStatus: Engine {get set}
    var km: Double {get set}
    
    func CarInfo()
}


//Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем (реализовывать следует только те действия, реализация которых общая для всех автомобилей)

//почему без mutating выдает ошибку "Cannot assign to property: 'self' is immutable"?
extension CarProtocol {
    mutating func startEngine () {
        engineStatus = .on
        print ("двигатель \(carBrand) заведен")
    }
    mutating func endEngine () {
        engineStatus = .off
        print ("двигатель \(carBrand) остановлен")
    }
}

extension CarProtocol {
    mutating func newDistance(addDistance: Double) {
        self.km += addDistance
        print ("Автомобиль \(self.carBrand) проехал еще \(addDistance) километров, итоговый пробег составляет \(self.km) килограмм")
    }
}




