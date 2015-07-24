//
//  menuScrView.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/13.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit

class MenuTouchScrView: UIScrollView {
    var Delegate: ScrollViewDelegate!
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch_began")
        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            self.Delegate.touchJudgment(Int(t.view.tag), touchFlg: true)
        }
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch_moved")
        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            self.Delegate.touchJudgment(Int(t.view.tag), touchFlg: false)
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch_ended")
        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            self.Delegate.modalChanged(Int(t.view.tag))
            self.Delegate.touchJudgment(Int(t.view.tag), touchFlg: false)
        }
    }
}