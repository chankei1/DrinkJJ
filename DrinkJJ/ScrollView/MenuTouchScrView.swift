//
//  menuScrView.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/13.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import Foundation
import UIKit

class MenuTouchScrView: UIScrollView {
    
    //var drinkSelectViewController = DrinkSelectViewController()
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch_began")
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch_moved")
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch_ended")
        
        
        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            
            println("Menu　tagName：\(t.view.tag)")
            
            
        }
        
        
    }
}