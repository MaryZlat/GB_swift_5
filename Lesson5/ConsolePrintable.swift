import Foundation

protocol ConsolePrintable: CustomStringConvertible {
    func printDescription()
}
extension ConsolePrintable{
    func printDescription(){
    print(description)
    }
}
