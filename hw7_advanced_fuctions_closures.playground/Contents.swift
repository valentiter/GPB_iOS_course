import Foundation



//Функция, принимающая функцию как параметр

func perimeter(sideСount: Int, sideLength: Int) -> Int {
    sideСount * sideLength
}

typealias CalcFunc = (Int, Int) -> Int


func calcPolygon(getNum: CalcFunc, sideСount: Int, sideLength: Int) -> Int {
    getNum(sideСount, sideLength)
}

calcPolygon(getNum: perimeter, sideСount: 30, sideLength: 32)



//Функция с несколькими замыканиями

let name = "Ann"

func doSomething(name: String, completion: (String) -> Void, onFailture: () -> Void) {
    if name.isEmpty {
        onFailture()
    } else {
        completion(name)
    }
}


doSomething(name: name) { name in
    print("Yes, you did")
} onFailture: {
    print("You do nothing")
}



//Функция с autoclosure

class myType: CustomStringConvertible {
    init() {
        print("Init")
    }
    
    var description: String {
        return "my type description"
    }
    
}

func myAutoclosureFunc(_ value: @autoclosure() -> Any) {
    print("Before")
    print(value())
    print("The end")
}

myAutoclosureFunc(myType())



//nested fuctions

func add(p1: Int, p2: Int) -> Int {
    
    func multiplySum(sum: Int) -> Int {
        sum * 2
    }
    
    let sum = p1 + p2
    
    let result = multiplySum(sum: sum)
    
    return result
}

print(add(p1: 4567, p2: 23456))



//Дженерик-функция с условием

func getGreatest<Element: Comparable>(num1: Element, num2: Element) -> Element? {
    if num1 == num2 {
        return nil
    } else if num1 > num2 {
        return num1
    } else {
        return num2
    }
}

getGreatest(num1: "Swift", num2: "Java")
getGreatest(num1: 12345, num2: 21)
