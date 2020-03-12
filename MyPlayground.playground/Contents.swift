import UIKit



let arr = [1,2,3]
let res = arr.map { (item) -> String in
    return "\(item)"
}.flatMap { (str) -> [Int] in
    return [Int(str)!]
}
print(res)


class Ref<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
    
}
// 方法1
struct Box<T> {
    private var ref: Ref<T>
    init(value: T) {
        ref = Ref(value: value)
    }
    
    var value: T {
        get {
            return ref.value
        }
        set {
            guard isKnownUniquelyReferenced(&ref) else {
                ref = Ref(value: newValue)
                return
            }
            ref.value = newValue
        }
        
    }
}

struct User {
    var identifier = 1
}

let user = User()
let box1 = Box(value: user)
var box2 = box1

box2.value.identifier = 2

// 方法2
protocol DCJCopyable {
    func copyOnWright() -> DCJCopyable
}

class Employee: NSObject, DCJCopyable {
    var name = ""
    init(name: String) {
        self.name = name
    }
    func copyOnWright() -> DCJCopyable {
        return Employee(name: self.name)
    }
    func changeName(newName: String) -> Void {
        self.name = newName
    }
    
}

struct Company {
    var employee = Employee(name: "kek")
    var employeeOnWright: Employee {
        mutating get {
            employee = employee.copyOnWright() as! Employee
            return employee
        }
    }
    
    mutating func changeNameOnWright(newName: String) -> Void {
        self.employeeOnWright.changeName(newName: newName)
    }
}

var comA = Company()
let comB = comA
comA.changeNameOnWright(newName: "uye")
comA.employee.name
comB.employee.name

//func someFunc1(para: String) {
//    print(para)
//}
//
//func someFunc2(para: String, para2: String) {
//    print(para)
//    print(para2)
//
//}
//someFunc1(para: "ie")
//someFunc2(para: "ckkc", para2: "lwl")

//enum 
