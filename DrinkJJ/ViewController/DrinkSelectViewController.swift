//
//  DrinkSelectViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkSelectViewController: UIViewController{
    
    //スクリーンの幅
    let screenWidth = Int( UIScreen.mainScreen().bounds.size.width);
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.mainScreen().bounds.size.height);
    //ジャンルラベルの作成
    var calLabel: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("ドリンク選択")
        
        //jsonファイルの読み込み
        var path = NSBundle.mainBundle().pathForResource("MenuJSON", ofType:"txt")
        var jsondata = NSData(contentsOfFile: path!)
        
        //辞書データに変換
        let jsonArray = NSJSONSerialization.JSONObjectWithData(jsondata!, options: nil, error: nil) as! NSArray
        
        //メニューを入れておく場所
        var genre = []
        //println(jsonArray)
        
        println(jsonArray.count)
        
        for(var i = 0; i<jsonArray.count; i++){
            calLabel.insert(UILabel(), atIndex: i)
            calLabel[i] = UILabel(frame: CGRectMake(0,0,80,80))
            calLabel[i].text = jsonArray[i]["name"] as! String
            calLabel[i].backgroundColor = UIColor.whiteColor()
            calLabel[i].textAlignment = NSTextAlignment.Center
            calLabel[i].layer.position = CGPoint(x: screenWidth/3+(i%2*100), y: screenHeight/6+(i/2*100))
            calLabel[i].userInteractionEnabled = true;
            calLabel[i].font = UIFont(name:"HelveticaNeue-Bold",size:25)
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
}
