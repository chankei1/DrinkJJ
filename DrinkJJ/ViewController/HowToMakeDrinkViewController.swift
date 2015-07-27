//
//  HowToMakeDrink.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class HowToMakeDrinkViewController: UIViewController, UITextViewDelegate{
    
    //画面サイズ
    let screenRotationWidth = UIScreen.mainScreen().bounds.size.width
    let screenRotationHeight = UIScreen.mainScreen().bounds.size.height
    
    var drinkName: String = ""
    
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
        self.title = "作り方"
        
        howToMake()
    }

    //jsonから取得したドリンク説明データをtextViewに表示する
    func howToMake(){
        //jsonファイルの読み込み
        var path = NSBundle.mainBundle().pathForResource("DrinkDataJSON", ofType:"txt")
        var jsondata = NSData(contentsOfFile: path!)
        
        //辞書データに変換
        let jsonArray = NSJSONSerialization.JSONObjectWithData(jsondata!, options: nil, error: nil) as! NSArray
        
        
        //ナビゲーションバーの高さを取得
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        
        let drinkTextView: UITextView = UITextView(frame: CGRectMake(0, 0, screenRotationWidth, screenRotationHeight - navBarHeight!))
        //　なんで/2しているかわからない... +navBarHeightしてるのはわかるが。
        drinkTextView.layer.position = CGPoint(x: screenRotationWidth/2, y: screenRotationHeight/2 + navBarHeight!)
        drinkTextView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        drinkTextView.text = ""
        drinkTextView.font = UIFont.systemFontOfSize(CGFloat(20))
        drinkTextView.textColor = UIColor.blackColor()
        drinkTextView.textAlignment = NSTextAlignment.Left
        drinkTextView.dataDetectorTypes = UIDataDetectorTypes.All //日付や数字の色を変更する
        drinkTextView.editable = false;
        drinkTextView.delegate = self;
        
        //drinkNameをカテゴリーごとにまとめる
        summarizedRoughForDrink()
        
        //分類の追加
        for data in jsonArray{
            if(drinkName == data["drink_name"] as! String){
                drinkTextView.text = data["drink_howtomake"] as! String
            }
        }
        
        
        // TextViewをViewに追加する.
        self.view.addSubview(drinkTextView)
        
    }
    
    //分類が同じドリンクは一つにまとめる
    func summarizedRoughForDrink(){
        
        //classificationの処理と同じ、あとでコピペしておく
        
    }
    
}