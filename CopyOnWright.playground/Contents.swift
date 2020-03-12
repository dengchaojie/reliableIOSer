import UIKit
import Foundation

struct Person {
    var firstname: String
    var lastname: String
}

var per1 = Person(firstname: "chao jie", lastname: "deng")
let per2 = per1


//let arr = [1,2,3]
//
//arr.withUnsafeBufferPointer { ptr in
//    return ptr
//}
per1.firstname = "wei jian"
//per1.withUnsafeBufferPointer { ptr in
//    return ptr
//
//}
print(per1.firstname)
print(per2.firstname)
