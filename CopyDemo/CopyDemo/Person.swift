//
//  Person.swift
//  CopyDemo
//
//  Created by chao jie deng on 2020/3/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

import Foundation

class Person: NSObject, NSCopying {
    var name: String?
    var age: Int?
    required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let objCopy: Person = type(of: self).init(name: "", age: 0)
        objCopy.name = self.name
        objCopy.age = self.age
        return objCopy

    }
    

    
}
