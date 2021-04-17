import Foundation

print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    var index = 0
    
    if args[args.count - 1].elementsEqual("count") {
        var counter = 0
        for elem in args {
            if Int(elem) != nil {
                counter += 1
            }
        }
        return counter
    } else if args[args.count - 1].elementsEqual("avg") {
        if args.count == 1 {
            return 0
        }
        var sum = 0
        for elem in args {
            let num = Int(elem)
            if num != nil {
                sum += num!
            }
        }
        return sum / (args.count - 1)
    } else if args[args.count - 1].elementsEqual("fact") {
        if args.count == 1 {
            return 0
        }
        return Int(factorial(factorialNumber: UInt64(args[0])!))
    } else {
        var e1 = 0
        var e2 = 1
        var oper = ""
        
        for elem in args {
            if index == 0 {
                e1 = Int(elem)!
            } else if index == 1 {
                oper = elem
            } else  {
                e2 = Int(elem)!
            }
            index += 1
        }
        if oper.elementsEqual("+") {
            return e1 + e2
        } else if oper.elementsEqual("-") {
            return e1 - e2
        } else if oper.elementsEqual("/") {
            return e1 / e2
        } else if oper.elementsEqual("%") {
            return e1 % e2
        } else {
            return e1 * e2
        }
    }
   // return -1
}

func calculate(_ arg: String) -> Int {
    let arr = arg.components(separatedBy: " ")
    return calculate(arr)
}

func factorial(factorialNumber: UInt64) -> UInt64 {
    if factorialNumber == 0 {
        return 1
    } else {
        return factorialNumber * factorial(factorialNumber: factorialNumber - 1)
    }
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
