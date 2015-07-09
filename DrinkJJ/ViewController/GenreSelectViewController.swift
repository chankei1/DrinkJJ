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
    //ジャンルラベルの作成
    var calLabel: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // GenreSelectViewControllerのタイトルを設定する.
        self.title = "ジャンル選択"
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.greenColor()
        
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
        
        
        for(var i = 0; i<8; i++){
            calLabel.insert(UILabel(), atIndex: i)
            calLabel[i] = UILabel(frame: CGRectMake(0,0,80,80))
            calLabel[i].text = genreMenu[i]
            calLabel[i].backgroundColor = UIColor.whiteColor()
            calLabel[i].textAlignment = NSTextAlignment.Center
            calLabel[i].layer.position = CGPoint(x: screenWidth/3+(i%2*100), y: screenHeight/4+(i/2*100))
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
        var touchGenreName: String = ""
        var touchGenreTag: Int = 0
        //タップしたラベルの取得
        for(var i=0; i<8; i++){
            for touch: AnyObject in touches {
                var t: UITouch = touch as! UITouch
                if(t.view.tag == self.calLabel[i].tag){
                    println(calLabel[i].tag)
                    touchGenreName = calLabel[i].text!
                    touchGenreTag = calLabel[i].tag
                }
            }
        }
        
        println("タップしたジャンル名：\(touchGenreName)")
        println("タップしたジャンルのタグ：\(touchGenreTag)")
        
        let drinkSelectViewController = DrinkSelectViewController()
        //タップ判定
        if(touchGenreTag != 0){
            drinkSelectViewController.genreTagNum = touchGenreTag
            self.navigationController?.pushViewController(drinkSelectViewController, animated: true)
        }
        

//        switch touchGenreTag {
//        case 1:
//            println("1")
//            
//            // Viewを移動する.
//            //self.presentViewController(drinkSelectViewController, animated: false, completion: nil)
//            drinkSelectViewController.genreTagNum = touchGenreTag
//            self.navigationController?.pushViewController(drinkSelectViewController, animated: true)
//            
//        case 2:
//            println("2")
//            drinkSelectViewController.genreTagNum = touchGenreTag
//            self.navigationController?.pushViewController(drinkSelectViewController, animated: true)
//            
//        case 3:
//            println("3")
//            
//        default:
//            break
//        }
        

    }

//    func touch(search: UIButton){
//        
//        // 遷移するViewを定義する.
//        let drinkViewController: UIViewController = DrinkSelectViewController()
//        
//        // Viewの移動する.
//        self.presentViewController(drinkViewController, animated: false, completion: nil)
//    }
    
    func onClickMyButton(){
//        
//        // 遷移するViewを定義する.
//        let drinkSelectViewController: UIViewController = DrinkSelectViewController()
//        
//        // Viewを移動する.
//        self.presentViewController(drinkSelectViewController, animated: false, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}