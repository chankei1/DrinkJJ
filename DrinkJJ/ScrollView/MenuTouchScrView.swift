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
        //println("touch_began")
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("touch_moved")
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("touch_ended")
        var a:Int = 0
        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            self.Delegate.modalChanged(Int(t.view.tag))
        }
    }
}