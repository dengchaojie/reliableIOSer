//
//  ViewController.swift
//  CopyDemo
//
//  Created by chao jie deng on 2020/3/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let per = Person(name: "dcj", age: 10)

        let newPer = per.copy(with: nil) as! Person
        newPer.name = "zxx"
        print((newPer.name != nil) ? newPer.name! : "" )
        print((per.name != nil) ? per.name! : 0)

        
        let ani = Animal(name: "abc", age: 17)
        let newAni = Animal(with: ani)
        newAni.name = "dog"
        print(newAni.name ?? "")
        print(ani.name ?? "")

        let someStr = SomeStr(someA: 10, someB: 20)
        
        
    }


}

