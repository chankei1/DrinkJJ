//
//  DrinkSelectViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkSelectViewController: UIViewController, ScrollViewDelegate{
    
    var genreTagNum: Int = 0
    var genreName: String = ""
    
    //スクリーンの幅
    var screenWidth = Int( UIScreen.mainScreen().bounds.size.width);
    //スクリーンの高さ
    var screenHeight = Int(UIScreen.mainScreen().bounds.size.height);
    //ジャンルラベルの作成
    var calLabel: [UILabel] = []
    
    
    //UIScrollViewの作成
    let drinkSelectScrView = MenuTouchScrView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let drinkDataViewController = DrinkDataViewController()

        drinkSelectScrView.frame = self.view.frame
        drinkSelectScrView.backgroundColor = UIColor.redColor()
        
        //DelegateとはMenuTouchScrViewのDelegateのこと. delegateだとUIScrollViewDelegateになってしまう.
        drinkSelectScrView.Delegate = self
        drinkSelectScrView.userInteractionEnabled = true
    
        
        // GenreSelectViewControllerのタイトルを設定する.
        self.title = "メニュー選択"
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.greenColor()
        
        setDrinkView()
        
        self.view.addSubview(drinkSelectScrView)
    }
    
    /*
    // JSONからデータを取得して表示する
    // jsonArray.count :全ドリンクの種類
    // genreTagNum :タップしたジャンルのタグナンバー
    // genreName :タップしたジャンルの名前
    */
    func setDrinkView(){
        //jsonファイルの読み込み
        var path = NSBundle.mainBundle().pathForResource("MenuJSON", ofType:"txt")
        var jsondata = NSData(contentsOfFile: path!)
        
        //辞書データに変換
        let jsonArray = NSJSONSerialization.JSONObjectWithData(jsondata!, options: nil, error: nil) as! NSArray
        
        //メニューを入れておく場所
        var genre = []
        var drinkNum = 0
        var name:String = ""
        
        for data in jsonArray{
            if(genreTagNum == data["category_id"] as! Int){
                name = data["name"] as! String
                calLabel.insert(UILabel(), atIndex: drinkNum)
                calLabel[drinkNum] = UILabel(frame: CGRectMake(0,0,80,80))
                calLabel[drinkNum].text = name
                calLabel[drinkNum].backgroundColor = UIColor.whiteColor()
                calLabel[drinkNum].textAlignment = NSTextAlignment.Center
                calLabel[drinkNum].layer.position = CGPoint(x: screenWidth/3+(drinkNum%2*100), y: screenHeight/9+(drinkNum/2*100))
                calLabel[drinkNum].userInteractionEnabled = true;
                calLabel[drinkNum].font = UIFont(name:"HelveticaNeue-Bold",size:25)
                calLabel[drinkNum].tag = drinkNum+1
                calLabel[drinkNum].numberOfLines = 0;
                calLabel[drinkNum].font = UIFont.systemFontOfSize(12);//文字サイズ
                calLabel[drinkNum].textAlignment = NSTextAlignment.Center//センター揃え
                //calLabel[i].sizeToFit();
                calLabel[drinkNum].layer.masksToBounds = true
                calLabel[drinkNum].layer.cornerRadius = 40.0
                self.view.addSubview(calLabel[drinkNum])
                //スクロール
                drinkSelectScrView.addSubview(calLabel[drinkNum])
                drinkNum++
            }
            
        }
        println("ドリンクの数:\(drinkNum)")
        //スクリーン何枚分かを指定する
        drinkSelectScrView.contentSize = CGSizeMake(320, (CGFloat)(drinkNum/2*120));
        
    }
    
    
    func modalChanged(TouchNumber: Int) {
        println("タップしたドリンクのtag:\(TouchNumber)")
    }

    
}

