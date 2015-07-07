//
//  GenreSelectViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class GenreSelectViewController: UIViewController{
    
    //全てのジャンルを設置
    let genreMenu: [String] = ["ビール", "SD", "サワー", "リキュール", "ウイスキー", "酒", "焼酎", "ワイン"]
    let rect = UIScreen.mainScreen().bounds;
    //スクリーンの幅
    let screenWidth = Int( UIScreen.mainScreen().bounds.size.width);
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.mainScreen().bounds.size.height);
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(rect)
        println(screenWidth)//幅
        println(screenHeight)//高さ
        
        //ジャンルの設置
        setView()
        
        //タップ処理
        //touchGenre()
    }
    
    
    
    //ジャンルを8種類を設置する
    func setView(){
        
        var calLabel: [UILabel] = []
        for(var i = 0; i<8; i++){
            calLabel.insert(UILabel(), atIndex: i)
            calLabel[i] = UILabel(frame: CGRectMake(0,0,80,80))
            calLabel[i].text = genreMenu[i]
            calLabel[i].backgroundColor = UIColor.whiteColor()
            calLabel[i].textAlignment = NSTextAlignment.Center
            calLabel[i].layer.position = CGPoint(x: screenWidth/3+(i%2*100), y: screenHeight/6+(i/2*100))
            calLabel[i].userInteractionEnabled = true;
            calLabel[i].font = UIFont(name:"HelveticaNeue-Bold",size:20)
            calLabel[i].tag = i+1
            calLabel[i].numberOfLines = 0;
            calLabel[i].font = UIFont.systemFontOfSize(12);//文字サイズ
            calLabel[i].textAlignment = NSTextAlignment.Center//センター揃え
            //calLabel[i].sizeToFit();
            calLabel[i].layer.masksToBounds = true
            calLabel[i].layer.cornerRadius = 40.0
            self.view.addSubview(calLabel[i])
        }
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("ラベルを押しました")
        
        
    }
    
    
    
}