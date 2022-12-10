import Foundation

// В Playground реализуйте некоторый базовый класс из выбранной вами области описания (тематики).
//Добавьте в него свойства и методы, а также несколько инициализаторов. Класс должен содержать свойства и методы разной области видимости (private, fileprivate, internal или public)
//Создайте несколько классов-наследников. Переопределите при необходимости свойства и методы родителя. А также добавьте свои.
//В основном пространстве Playground создайте функцию для демонстрации полиморфизма.

class Homo {
    var brainCapacity: Int
    var height: Int
    
    var beginningOfExistence: Int
    var endOfExistence: String = "0"
    var numOrder: String
    
    fileprivate var lifePeriod: String {
        return "\(beginningOfExistence) - \(endOfExistence) \(numOrder) years ago"
    }
    
    func go() -> Void {
        
    }
    
    init() {
        brainCapacity = 0
        height = 0
        beginningOfExistence = 0
        numOrder = " "
    }
}

class Neanderthalensis: Homo {
    
    
    var masteredToolMaterial: String = " "
    
    private func performRitual() -> String {
        return "Ritual perfomed"
    }
    
    public func lightFire() -> String {
        return "The fire is lit"
    }
    
    func makeTool() -> String {
        return "I made the tool from \(masteredToolMaterial)"
    }
    
}

class Cro_Magnon: Neanderthalensis {
    
    private func rockCarvings() -> String {
        return "I made rock carvings"
    }

    func sewClothes() -> String {
        return "I made the clothes"
    }

    override func makeTool() -> String {
        return "I made complicated tool from \(masteredToolMaterial)"
    }
}


let neanderthalensis = Neanderthalensis()
neanderthalensis.beginningOfExistence = 130
neanderthalensis.endOfExistence = "28"
neanderthalensis.numOrder = "thousand"
neanderthalensis.masteredToolMaterial = "rock"


let cro_Magnon = Cro_Magnon()
cro_Magnon.beginningOfExistence = 40
cro_Magnon.numOrder = "thousand"
cro_Magnon.masteredToolMaterial = "shit and sticks"


neanderthalensis.makeTool()
cro_Magnon.makeTool()
