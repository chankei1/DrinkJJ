//
//  DrinkDataViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkDataViewController: UIViewController {
    
    private var beerImageView: UIImageView!
    var aaaaa: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIImageViewを作成する.
        beerImageView = UIImageView(frame: CGRectMake(0,0,100,120))
        
        // 表示する画像を設定する.
        let beerImage = UIImage(named: "beer.png")
        
        // 画像をUIImageViewに設定する.
        beerImageView.image = beerImage
        
        // 画像の表示する座標を指定する.
        beerImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(beerImageView)
        
        println("\(aaaaa)")
    }
    

}
