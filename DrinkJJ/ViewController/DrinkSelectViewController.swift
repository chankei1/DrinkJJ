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
    var titleGenreName: String = ""
    var drinkName: [String] = []
    
    //ドリンクの数を格納しておく
    var drinkNum: Int = 0
    
    let drinkDataViewController = DrinkDataViewController()
    
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
        
        //背景の追加
        let myImage: UIImage = UIImage(named: "backimage0.png")!
        let myImageView: UIImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(0, 0, myImage.size.width, myImage.size.height)
        
        let drinkDataViewController = DrinkDataViewController()

        drinkSelectScrView.frame = self.view.frame
        //drinkSelectScrView.backgroundColor = UIColor.redColor()
        
        //DelegateとはMenuTouchScrViewのDelegateのこと. delegateだとUIScrollViewDelegateになってしまう.
        drinkSelectScrView.Delegate = self
        drinkSelectScrView.userInteractionEnabled = true
        drinkSelectScrView.indicatorStyle = UIScrollViewIndicatorStyle.White
    
        
        // GenreSelectViewControllerのタイトルを設定する.
        self.title = titleGenreName
        
        setDrinkView()
        
        self.view.addSubview(myImageView)
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
        drinkNum = 0
        var name:String = ""
        
        
        for data in jsonArray{
            if(genreTagNum == data["category_id"] as! Int){
                name = data["name"] as! String
                calLabel.insert(UILabel(), atIndex: drinkNum)
                calLabel[drinkNum] = UILabel(frame: CGRectMake(0,0,80,80))
                calLabel[drinkNum].text = name
                calLabel[drinkNum].backgroundColor = UIColor.whiteColor()
                calLabel[drinkNum].alpha = 0.8
                calLabel[drinkNum].textAlignment = NSTextAlignment.Center
                calLabel[drinkNum].layer.position = CGPoint(x: screenWidth/3+(drinkNum%2*100), y: screenHeight/4+(drinkNum/2*100))
                calLabel[drinkNum].userInteractionEnabled = true;
                calLabel[drinkNum].font = UIFont(name:"HelveticaNeue-Bold",size:15)
                calLabel[drinkNum].tag = drinkNum+1
                calLabel[drinkNum].numberOfLines = 0;
                calLabel[drinkNum].textAlignment = NSTextAlignment.Center//センター揃え
                //calLabel[i].sizeToFit();
                calLabel[drinkNum].layer.masksToBounds = true
                calLabel[drinkNum].layer.cornerRadius = 40.0
                self.view.addSubview(calLabel[drinkNum])
        
                //空の配列に選択したジャンルの全ドリンクを格納する
                drinkName.append(name)
                
                //スクロール
                drinkSelectScrView.addSubview(calLabel[drinkNum])
                
                drinkNum++
            }
            
        }
        println("ドリンクの数:\(drinkNum)")
        
        //スクリーン何枚分かを指定する
        drinkSelectScrView.contentSize = CGSizeMake(320, (CGFloat)(drinkNum/2*120));
        
    }
    
    //タップしたラベルの透明度を変更する
    func touchJudgment(TouchNumber: Int, touchFlg: Bool){
        if(TouchNumber != 0){
            if(touchFlg){
                calLabel[TouchNumber-1].alpha = 0.5
            } else {
                calLabel[TouchNumber-1].alpha = 0.8
            }
        }
    }
    
    //タップしたラベルを判別し、画面遷移する
    func modalChanged(TouchNumber: Int) {
        
        //全ドリンクの透明度を初期化する
        for(var i=0; i<drinkNum; i++){
            calLabel[i].alpha = 0.8
        }
        
        let drinkDataViewController = DrinkDataViewController()
        
        println("タップしたドリンクのtag:\(TouchNumber)")
        
        if(TouchNumber != 0){
            drinkDataViewController.titleDrinkName = drinkName[TouchNumber-1]
            self.navigationController?.pushViewController(drinkDataViewController, animated: false)
        }
        
    }
    
}

