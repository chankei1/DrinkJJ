//
//  ViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        println("ああああ")
        start()
        
    }
    
    func start(){
        // 遷移するViewを定義する.
        let topViewController: UIViewController = TopViewController()
        
        // アニメーションを設定する.
        topViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動をする.
        self.presentViewController(topViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

