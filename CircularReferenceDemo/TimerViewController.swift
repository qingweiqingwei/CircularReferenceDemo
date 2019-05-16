//
//  TimerViewController.swift
//  CircularReferenceDemo
//
//  Created by 招财猫iOS-3 on 2019/5/16.
//  Copyright © 2019 QW. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timer: Timer?
    var num = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // 直接使用此方法，会出现循环self与计时器循环引用
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        
        // Timer扩展方法，间接调用方法
        timer = Timer.scheduledTimerCustom(timeInterval: 1, repeats: true, completion: { [weak self] (_) in
            self?.timerAction()
        })
    }
    
    @objc func timerAction() {
        self.num += 1
        print(self.num)
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
        print(#file, "已释放")
    }
}

extension Timer {
    class func scheduledTimerCustom(timeInterval: TimeInterval, repeats: Bool, completion: @escaping ((Timer)->())) -> Timer {
        return Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerSelector(timer:)), userInfo: completion, repeats: repeats)
    }
    @objc class func timerSelector(timer: Timer) {
        guard let completion = timer.userInfo as? ((Timer) -> ()) else {
            return
        }
        completion(timer)
    }
}
