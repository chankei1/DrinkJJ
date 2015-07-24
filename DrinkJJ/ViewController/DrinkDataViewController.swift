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
        
        // GenreSelectViewControllerのタイトルを設定する.
        //self.title = drinkName
        
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
        let nextButton: UIButton = UIButton(frame: CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10))
        nextButton.backgroundColor = UIColor.redColor();
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("分類", forState: .Normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.alpha = 0.8
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/3 , y:self.view.bounds.height/1.6)
        nextButton.addTarget(self, action: "classificationDrinkBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(nextButton);
        
    }
    
    //説明
    func descriptionDrink(){
        // ボタンを生成する.
        let nextButton: UIButton = UIButton(frame: CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10))
        nextButton.backgroundColor = UIColor.redColor();
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("説明", forState: .Normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.alpha = 0.8
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/3*2 , y:self.view.bounds.height/1.6)
        nextButton.addTarget(self, action: "descriptionDrinkBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(nextButton);
        
    }
    
    //作り方
    func howToMakeDrink(){
        // ボタンを生成する.
        let nextButton: UIButton = UIButton(frame: CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10))
        nextButton.backgroundColor = UIColor.redColor();
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("作り方", forState: .Normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.alpha = 0.8
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/3 , y:self.view.bounds.height/1.3)
        nextButton.addTarget(self, action: "howToMakeDrinkBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(nextButton);
        
    }

    //ワンポイント
    func drinkOnePointDrink(){
        // ボタンを生成する.
        let nextButton: UIButton = UIButton(frame: CGRectMake(0, 0, screenRotationWidth/3.2, screenRotationHeight/10))
        nextButton.backgroundColor = UIColor.redColor();
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("要点", forState: .Normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.alpha = 0.8
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/3*2 , y:self.view.bounds.height/1.3)
        nextButton.addTarget(self, action: "drinkOnePointDrinkBtn", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(nextButton);
        
    }
    
    //ボタンを押した時の画面遷移処理
    func classificationDrinkBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let genreSelectViewController: UIViewController = GenreSelectViewController()
        self.navigationController?.pushViewController(genreSelectViewController, animated: false)
        
    }
    
    
    func descriptionDrinkBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let genreSelectViewController: UIViewController = GenreSelectViewController()
        self.navigationController?.pushViewController(genreSelectViewController, animated: false)
        
    }
    
    
    func howToMakeDrinkBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let genreSelectViewController: UIViewController = GenreSelectViewController()
        self.navigationController?.pushViewController(genreSelectViewController, animated: false)
        
    }
    
    
    
    func drinkOnePointDrinkBtn(){
        
        // 遷移するViewを定義し
        // Viewを移動する
        let genreSelectViewController: UIViewController = GenreSelectViewController()
        self.navigationController?.pushViewController(genreSelectViewController, animated: false)
        
    }
    
    
    

}
