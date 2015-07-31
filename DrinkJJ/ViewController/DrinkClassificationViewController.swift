//
//  DrinkClassificationViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkClassificationViewController: UIViewController, UITextViewDelegate {
    
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
        self.title = "分類"
        
        drinkClassView()
        
    }
    
    //jsonから取得したドリンク分類データをtextViewで表示する
    func drinkClassView(){
        
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
        drinkTextView.font = UIFont(name: "HiraKakuProN-W3", size: 20)
        drinkTextView.textColor = UIColor.blackColor()
        drinkTextView.textAlignment = NSTextAlignment.Center
        drinkTextView.dataDetectorTypes = UIDataDetectorTypes.All //日付や数字の色を変更するta
        drinkTextView.editable = false;
        drinkTextView.delegate = self;
        
        //drinkNameをカテゴリーごとにまとめる
        summarizedRoughForDrink()
        
        //分類の追加
        for data in jsonArray{
            if(drinkName == data["drink_name"] as! String){
                drinkTextView.text = data["drink_classification"] as! String
            }
        }
        
        
        // TextViewをViewに追加する.
        self.view.addSubview(drinkTextView)

    }
    
    //分類が同じドリンクは一つにまとめる
    func summarizedRoughForDrink(){
        
        var summarizedRough:String = drinkName
        
        switch summarizedRough {
            
            //瓶ビール
            case "(瓶ビール)キリン", "(瓶ビール)アサヒスーパードライ", "(瓶ビール)サッポロ黒ラベル", "ノンアルコールビール":
                drinkName = "瓶ビール"
            
            case "黒ウーロン茶", "ウーロン茶", "玉露入りお茶", "グレープフルーツジュース", "オレンジジュース":
                drinkName = "ソフトドリンク"
            
            case "ライチミックスジュース", "ゴールドキウイミックスジュース", "アップルジュース", "クランベリージュース":
                drinkName = "ソフトドリンク(缶)"
            
            case "コーラ", "サイダー", "ジンジャーエール":
                drinkName = "ソフトドリンク(炭酸)"
            
            
            
            
            
            default:
                println("当てはまりませんでした")
            
        }
        
        
    }
    
}