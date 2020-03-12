//
//  ViewController.swift
//  CopyOnWright
//
//  Created by chao jie deng on 2020/3/11.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var per1: Person!
    var per2: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let per1 = Person(firstname: "chao jie", lastname: "deng")
        let per2 = per1
        
        self.per1 = per1
        self.per2 = per2
        print("ldld")
    }


}

