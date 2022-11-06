import Foundation

//the function adds two integer variables - outputs the sum

func findSum(firstNum: Int, secondNum: Int) -> Int {
    firstNum + secondNum
}



//функция принимает кортеж из числа и строки, приводит число к строке и выводит в консоль результат

func makeString(myTuple: (Int, String)) -> (String, String) {
    (String(myTuple.0), myTuple.1)
}



//the function takes an optional closure and an integer as an input, it performs the closure only if the number is greater than 0

typealias VoidCallBack = () -> Void

func closurePerformer(num: Int, myClosure: VoidCallBack) {
    if num > 0 {
        myClosure()
    }
}

closurePerformer(num: 43) { print("Closure performed") }



//the function takes a number as an input (year), check if it is a leap year

func isLeapYear(year: Int) -> Bool {
    if year % 4 != 0 || (year % 100 == 0 && year % 400 != 0) {
        return false
    } else {
        return true
    }
}
