//
//  SecondViewController.swift
//  CircularReferenceDemo
//
//  Created by QW on 2019/5/16.
//  Copyright © 2019 QW. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var quoView = QuoteView()
    var num = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        quoView.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50)
        quoView.backgroundColor = UIColor.red
        self.view.addSubview(quoView)
        
        // 解决闭包循环引用
        // 方法1：用 [weak self] 弱引用self
        quoView.firstBlock = { [weak self] in
            print(self?.num ?? 0)
        }
        
        // 方法2：用 [unowned self] 打破循环引用，此处应保证 nuowned的对象 不为nil，否则会crash
        quoView.secondClourse = { [unowned self] someString in
            print(self.num)
        }
    }
    
    deinit {
        print(#file, "已释放")
    }
}
