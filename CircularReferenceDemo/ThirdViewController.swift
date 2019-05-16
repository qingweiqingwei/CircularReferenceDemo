//
//  ThirdViewController.swift
//  CircularReferenceDemo
//
//  Created by 招财猫iOS-3 on 2019/5/16.
//  Copyright © 2019 QW. All rights reserved.
//

import UIKit

@objc protocol ProtoDelegate {
    func showTextText(withAny: Any)
}

class ThirdViewController: UIViewController {
    // 解决协议循环引用
    weak var delegate: ProtoDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    }
}
