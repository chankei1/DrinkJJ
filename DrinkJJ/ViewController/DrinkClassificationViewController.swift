//
//  DrinkClassificationViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkClassificationViewController: UIViewController {
    
    //画面サイズ
    let screenRotationWidth = UIScreen.mainScreen().bounds.size.width
    let screenRotationHeight = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景の追加
        let myImage: UIImage = UIImage(named: "backimage0.png")!
        let myImageView: UIImageView = UIImageView()
        myImageView.image = myImage
        myImageView.alpha = 0.8
        myImageView.frame = CGRectMake(0, 0, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        
        // GenreSelectViewControllerのタイトルを設定する.
        self.title = "分類"
        
    }

}