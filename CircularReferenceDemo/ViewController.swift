//
//  ViewController.swift
//  CircularReferenceDemo
//
//  Created by QW on 2019/5/16.
//  Copyright © 2019 QW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    fileprivate func initView() {
        let btn = self.createBtn(y: 150, title: "跳转到闭包循环页面")
        btn.addTarget(self, action: #selector(self.goNextAction), for: .touchUpInside)
        
        let btn2 = self.createBtn(y: 250, title: "跳转到代理循环页面")
        btn2.addTarget(self, action: #selector(self.goDelegateAction), for: .touchUpInside)
        
        let btn3 = self.createBtn(y: 350, title: "跳转到计时器循环调用页")
        btn3.addTarget(self, action: #selector(self.goTimerAction), for: .touchUpInside)
    }
    
    @objc func createBtn(y: CGFloat, title: String) -> UIButton {
        let btn = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width - 300)/2, y: y, width: 300, height: 50))
        btn.backgroundColor = UIColor.blue
        btn.setTitle(title, for: .normal)
        self.view.addSubview(btn)
        return btn
    }
    
    @objc fileprivate func goNextAction() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc fileprivate func goDelegateAction() {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc fileprivate func goTimerAction() {
        let vc = TimerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



