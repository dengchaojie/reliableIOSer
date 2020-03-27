import UIKit

var str = "Hello, playground"


struct Person {
    let name: String
    let age: Int
    
}

let per = Person(name: "dcj", age: 20)
//per.name = "ekek"



func myMin<T: Comparable>(_ a: T, _ b: T) -> T {
    print(#function)
    print(#file)
    print(#line)
    print(#column)
    return a < b ? a : b
}

myMin(2, 1)


protocol ListProtocol {
    associatedtype Element
    func push(_ element: Element)
    func pop() -> Element?
}

class IntList: ListProtocol {
    typealias Element = Int
    var list = [Element]()
    func push(_ element: Int) {
        list.append(element)
    }
    func pop() -> Int? {
        return list.popLast()
    }
    
}

class DoubleList: ListProtocol {
    typealias Element = Double
    var list = [Double]()
    func push(_ element: Double) {
        list.append(element)
    }
    func pop() -> Double? {
        return list.popLast()
    }
}

class AnyList<T>: ListProtocol {
    var list = [T]()
    typealias Element = T
    func push(_ element: T) {
        list.append(element)
    }
    func pop() -> T? {
        return list.popLast()
    }
}

extension ListProtocol where Element == Int {
    func isInt() -> Bool {
        return true
    }
}

typealias SomeClosure = (String) -> Void
let clo: SomeClosure = { (str) in
    print(str)
}
clo("kekeke")

protocol CopyProtocol {
    func copySelf() -> Self
}

struct SomeStruct: CopyProtocol {
    let value: Int
//    init(value: Int) {
//        self.value = value
//    }
    func copySelf() -> SomeStruct {
        return SomeStruct(value: self.value)
    }
}

class SomeClass: CopyProtocol {
    
    func copySelf() -> Self {
        return type(of: self).init()
    }
    
    required init() {
        
    }
}


enum SomeOpatinal<Wrapped> {
    case none
    case some(Wrapped)
}

let someValue: SomeOpatinal<Int>? = nil
let someValue2: Int? = nil
let someValue3: Optional<Int> = nil


func someFunc(_ aaa: Int) {
    print(aaa)
}
func someFunc(_ aaa: Float) {
    print(aaa)

}

someFunc(1)
someFunc(2.0)
