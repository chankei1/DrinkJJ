//
//  DrinkDataViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit
class DrinkDataViewController: UIViewController {
    
    var titleDrinkName: String = ""
    
    //画面サイズ
    let screenRotationWidth = UIScreen.mainScreen().bounds.size.width
    let screenRotationHeight = UIScreen.mainScreen().bounds.size.height
    
    private var beerImageView: UIImageView!
    
    let classificationBtn: UIButton = UIButton()
    let descriptionBtn: UIButton = UIButton()
    let howToMakeDrinkBtn: UIButton = UIButton()
    let onePointBtn: UIButton = UIButton()
    
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
        self.title = titleDrinkName
        
        /*
        // UIImageViewを作成
        // 表示する画像を設定
        // 画像をUIImageViewに設定
        // 画像の表示する座標を指定
        // 枠線を追加し太さを設定
        // UIImageViewをViewに追加
        */
        beerImageView = UIImageView(frame: CGRectMake(0,0,100,120))
        let beerImage = UIImage(named: "beer.png")
        beerImageView.image = beerImage
        beerImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        self.beerImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.beerImageView.layer.borderWidth = 3
        
        self.view.addSubview(beerImageView)
        
        //各ドリンクボタンの作成
        classificationDrink()
        descriptionDrink()
        howToMakeDrink()
        drinkOnePointDrink()
        
    }
    
    //分類
    func classificationDrink(){
        // ボタンを生成する.
        classificationBtn.frame = CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10)
        classificationBtn.backgroundColor = UIColor.redColor();
        classificationBtn.layer.masksToBounds = true
        classificationBtn.setTitle("分類", forState: .Normal)
        classificationBtn.layer.cornerRadius = 20.0
        classificationBtn.alpha = 0.8
        classificationBtn.layer.position = CGPoint(x: self.view.bounds.width/3 , y:self.view.bounds.height/1.6)
        classificationBtn.addTarget(self, action: "drinkClassificationTouchMoved", forControlEvents: .TouchDown)
        classificationBtn.addTarget(self, action: "drinkClassificationBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(classificationBtn);
        
    }
    
    //説明
    func descriptionDrink(){
        // ボタンを生成する.
        descriptionBtn.frame = CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10)
        descriptionBtn.backgroundColor = UIColor.redColor();
        descriptionBtn.layer.masksToBounds = true
        descriptionBtn.setTitle("説明", forState: .Normal)
        descriptionBtn.layer.cornerRadius = 20.0
        descriptionBtn.alpha = 0.8
        descriptionBtn.layer.position = CGPoint(x: self.view.bounds.width/3*2 , y:self.view.bounds.height/1.6)
        descriptionBtn.addTarget(self, action: "drinkDescriptionTouchMoved", forControlEvents: .TouchDown)
        descriptionBtn.addTarget(self, action: "drinkDescriptionBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(descriptionBtn);
        
    }
    
    //作り方
    func howToMakeDrink(){
        // ボタンを生成する.
        howToMakeDrinkBtn.frame = CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10)
        howToMakeDrinkBtn.backgroundColor = UIColor.redColor();
        howToMakeDrinkBtn.layer.masksToBounds = true
        howToMakeDrinkBtn.setTitle("作り方", forState: .Normal)
        howToMakeDrinkBtn.layer.cornerRadius = 20.0
        howToMakeDrinkBtn.alpha = 0.8
        howToMakeDrinkBtn.layer.position = CGPoint(x: self.view.bounds.width/3 , y:self.view.bounds.height/1.3)
        howToMakeDrinkBtn.addTarget(self, action: "howToMakeTouchMoved", forControlEvents: .TouchDown)
        howToMakeDrinkBtn.addTarget(self, action: "howToMakeBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(howToMakeDrinkBtn);
        
    }

    //ワンポイント
    func drinkOnePointDrink(){
        // ボタンを生成する.
        onePointBtn.frame = CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10)
        onePointBtn.backgroundColor = UIColor.redColor();
        onePointBtn.layer.masksToBounds = true
        onePointBtn.setTitle("要点", forState: .Normal)
        onePointBtn.layer.cornerRadius = 20.0
        onePointBtn.alpha = 0.8
        onePointBtn.layer.position = CGPoint(x: self.view.bounds.width/3*2 , y:self.view.bounds.height/1.3)
        onePointBtn.addTarget(self, action: "drinkOnePointTouchMoved", forControlEvents: .TouchDown)
        onePointBtn.addTarget(self, action: "drinkOnePointBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(onePointBtn);
        
    }
    
    //分類ボタンを押したときの処理
    func drinkClassificationBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let drinkClassificationViewController: UIViewController = DrinkClassificationViewController()
        self.navigationController?.pushViewController(drinkClassificationViewController, animated: false)
        
        //ボタンの色を元に戻す
        classificationBtn.backgroundColor = UIColor.redColor();
        
    }
    
    //説明ボタンを押したときの処理
    func drinkDescriptionBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let drinkDescriptionViewController: UIViewController = DrinkDescriptionViewController()
        self.navigationController?.pushViewController(drinkDescriptionViewController, animated: false)
        
        //ボタンの色を元に戻す
        descriptionBtn.backgroundColor = UIColor.redColor();
        
    }
    
    //作り方ボタンを押したときの処理
    func howToMakeBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let howToMakeDrinkViewController: UIViewController = HowToMakeDrinkViewController()
        self.navigationController?.pushViewController(howToMakeDrinkViewController, animated: false)
        
        //ボタンの色を元に戻す
        howToMakeDrinkBtn.backgroundColor = UIColor.redColor();
        
    }
    
    //要点ボタンを押したときの処理
    func drinkOnePointBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let drinkOnePointViewController: UIViewController = DrinkOnePointViewController()
        self.navigationController?.pushViewController(drinkOnePointViewController, animated: false)
        
        //ボタンの色を元に戻す
        onePointBtn.backgroundColor = UIColor.redColor();
        
    }
    
    
    //分類ボタンを押している状態の処理
    func drinkClassificationTouchMoved(){
        self.classificationBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    
    //説明ボタンを押している状態の処理
    func drinkDescriptionTouchMoved(){
        self.descriptionBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    
    //作り方ボタンを押している状態の処理
    func howToMakeTouchMoved(){
        self.howToMakeDrinkBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    
    //要点ボタンを押している状態の処理
    func drinkOnePointTouchMoved(){
        self.onePointBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    

}
