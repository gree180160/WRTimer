//
//  WRGCDTimerWrapper.swift
//  GoodProducts
//
//  Created by WillowRivers on 2021/4/8.
//  Copyright © 2021 com.WRTechnology. All rights reserved.
//

import UIKit

class WRGCDTimerWrapper: NSObject {
    weak var target: AnyObject!
    var timer: DispatchSourceTimer!
    
    ///resume + 1 , suspend - 1, kee deinit safe
    private var sourceCount: Int = 0
    
    deinit {
        guard timer != nil else {
            return
        }
        timer.cancel()
        if sourceCount <= 0 {
            self.fireTimer()
        }
        timer = nil
    }
    
    init(target: AnyObject, timerAction: Selector) {
        super.init()
        self.target = target
        let queue = DispatchQueue.global()
        timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer.schedule(deadline: DispatchTime.now(), repeating: .seconds(1), leeway: .milliseconds(10))
        timer.setEventHandler {[weak self] in
            guard let storngSelf = self else {return}
            DispatchQueue.main.async {
                storngSelf.perform(timerAction)
            }
        }
    }
    /// 启动timer
    public func fireTimer() {
        guard sourceCount <= 0 else {
            return
        }
        timer.resume()
        sourceCount += 1
    }
    
    /// stop timer block temporay( use whit resume() one by one)
    public func stopTimer() {
        guard sourceCount > 0 else {
            return
        }
        timer.suspend()
        sourceCount -= 1
    }
    
    /// Destroy timer, used when you are never use it .
    public func destroyTimer() {
        timer.cancel()
    }
    
    /// send aselector to another target
    /// - Parameter aSelector: aselector
    /// - Returns: new receiver
    override func forwardingTarget(for aSelector: Selector) -> Any? {
        return target
    }
}
