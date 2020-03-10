import UIKit

let arr = [1,2,3]
//let newArr = arr.map { (item) -> String in
//    "\(item)"
//}
// 将2维降到1维
let arr2 = [[1,2,3],[4,5,6]]
let newArr2 = arr2.flatMap { (item) -> [Int] in
    item
}
print(newArr2)
let newArr9 = arr.filter { (item) -> Bool in
    if item % 2 == 0 {
        return false
    }else {
        return true
    }
}
print(newArr9)
let sum = arr2.flatMap { (item) -> [Int] in
    item
}.reduce(0) { (res, item) -> Int in
    res + item
}
print(sum)

let newArr3 = arr.compactMap { (item) -> Int? in
    if item % 2 == 0 {
        return item
    }else {
        return nil
    }
}
print(newArr3)

//func ||(left: Bool, right: Bool) -> Bool {
//    if left {
//        return true
//    }else if right {
//        return right
//    }
//}

func ||(left: Bool, right: @autoclosure () -> Bool) -> Bool {
    if left {
        return true
    }else {
        return right()
    }

}
//Only classes and overridable class members can be declared 'open'; use 'public'
//open func someF() {
//
//}

public func someF2() {
    
}

internal func someF3() {
    
}

fileprivate func someF4() {
    
}

private func someF5() {
    
}
