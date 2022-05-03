//домашняя работа 5 (протоколы)
import Foundation

//Создать несколько объектов каждого класса
var car1 = SportCar(carBrand: "Ferrari", carType: .sport, carRelease: 2020, engineStatus: .off, km: 1250, windowState: .close, maxspeed: 270)
var car2 = TrunkCar(carBrand: "Mercedes", carType: .truck, carRelease: 2017, engineStatus: .off, km: 5000, wheelsNum: 8, trunkSize: 600, trunkLoad: 60)
var car3: TrunkCar? = TrunkCar(carBrand: "Kamaz", carType: .truck, carRelease: 2010, engineStatus: .off, km: 9908, wheelsNum: 10, trunkSize: 800, trunkLoad: 600)

print("Количество спортивных машин на парковке: \(SportCar.sportCarCount)")
print("Количество грузовых машин на парковке: \(TrunkCar.trunkCarCount)")


//Применить к ним различные действия
car1.CarInfo()
car2.CarInfo()
car1.openWindow()
car3?.trunkLoad = 200

car3 = nil
print("Количество грузовых машин на парковке: \(TrunkCar.trunkCarCount)")

car1.newDistance(addDistance: 650)
car1.printDescription()
car1.startEngine()
car1.printDescription()

car2.trunkLoad=200
car2.printDescription()
