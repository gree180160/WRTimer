//
//  ViewController.swift
//  WRTimer
//
//  Created by gree180160 on 04/12/2021.
//  Copyright (c) 2021 gree180160. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: WRGCDTimerWrapper!
       var numberValue: Int = 0
       var lab: UILabel!
       
       deinit {
           print("TestVC deinit")
           guard timer != nil else {
               return
           }
           timer.destroyTimer()
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           self.title = "test"
           self.configureSubviews()
       }
       
       func configureSubviews() {
           lab = UILabel(frame: CGRect(x: 10, y: 200, width: self.view.frame.width - 20, height: 40))
           lab.textAlignment = .center
           self.view.addSubview(lab)
           
           timer = WRGCDTimerWrapper(target: self, timerAction: #selector(timerAction))
           timer.fireTimer()
           lab.text = "number is " + numberValue.description
           
           let button = UIButton(frame: CGRect(x: 100, y: 360, width: 140, height: 70))
           button.setTitle("stop", for: .normal)
           button.setTitle("fire", for: .selected)
           button.backgroundColor = .brown
           self.view.addSubview(button)
           button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
       }
       
       @objc func buttonAction(sender: UIButton) {
           if sender.isSelected {
               timer.fireTimer()
           }else {
               timer.stopTimer()
           }
           sender.isSelected = !sender.isSelected
       }
       
       
       @objc func timerAction() {
           numberValue += 1
           lab.text = "number is " + numberValue.description
       }

}

