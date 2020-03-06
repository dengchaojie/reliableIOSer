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



//enum 
