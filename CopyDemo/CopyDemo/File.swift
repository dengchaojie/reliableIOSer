//
//  File.swift
//  CopyDemo
//
//  Created by chao jie deng on 2020/3/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

import Foundation

class Animal: NSObject {
    
    var name: String!
    var age: Int!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(with obj: Animal) {
        self.init(name: "", age: 0)
        self.name = obj.name
        self.age = obj.age
    }
}
