//
//  DrinkSelectViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkSelectViewController: UIViewController, UIScrollViewDelegate{
    
    var genreTagNum:Int = 0
    
    //スクリーンの幅
    var screenWidth = Int( UIScreen.mainScreen().bounds.size.width);
    //スクリーンの高さ
    var screenHeight = Int(UIScreen.mainScreen().bounds.size.height);
    //ジャンルラベルの作成
    var calLabel: [UILabel] = []
    
    
    //UIScrollViewの作成
    let drinkSelectScrView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinkSelectScrView.frame = self.view.frame
        drinkSelectScrView.backgroundColor = UIColor.redColor()
        
        drinkSelectScrView.delegate = self
    
        
        // GenreSelectViewControllerのタイトルを設定する.
        self.title = "メニュー選択"
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.greenColor()
        
        println("ドリンク選択")
        
        //jsonファイルの読み込み
        var path = NSBundle.mainBundle().pathForResource("MenuJSON", ofType:"txt")
        var jsondata = NSData(contentsOfFile: path!)
        
        //辞書データに変換
        let jsonArray = NSJSONSerialization.JSONObjectWithData(jsondata!, options: nil, error: nil) as! NSArray
        
        //メニューを入れておく場所
        var genre = []
        //println(jsonArray)
        println("aaa")
        println(jsonArray.count)
        println(genreTagNum)
        //println(jsonArray["category_id"])
        var i = 0
        var name:String = ""
        for data in jsonArray{
            if(genreTagNum == data["category_id"] as! Int){
                name = data["name"] as! String
                calLabel.insert(UILabel(), atIndex: i)
                calLabel[i] = UILabel(frame: CGRectMake(0,0,80,80))
                calLabel[i].text = name
                calLabel[i].backgroundColor = UIColor.whiteColor()
                calLabel[i].textAlignment = NSTextAlignment.Center
                calLabel[i].layer.position = CGPoint(x: screenWidth/3+(i%2*100), y: screenHeight/9+(i/2*100))
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
                //スクロール
                drinkSelectScrView.addSubview(calLabel[i])
                i++
            }
            
        }
        println("iの値：\(i)")
        //スクリーン何枚分かを指定する
        //drinkSelectScrView.contentSize = CGSizeMake(320, 480*2);
        drinkSelectScrView.contentSize = CGSizeMake(320, (CGFloat)(i/2*120));
        //drinkSelectScrView.contentSize = CGSizeMake(screenWidth, screenHeight*2);  (CGFloat)(70+menusNum/3*150)
        
        self.view.addSubview(drinkSelectScrView)
        
    }
    
}

