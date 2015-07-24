//
//  TopViewController.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/06.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    
    //画面サイズ
    let screenRotationWidth = UIScreen.mainScreen().bounds.size.width
    let screenRotationHeight = UIScreen.mainScreen().bounds.size.height
    
    //ドリンクを作成するボタンの作成
    let nextButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myImage: UIImage = UIImage(named: "backimage0.png")!
        let myImageView: UIImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(0, 0, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        
        // NavigationBarを取得する.
        self.navigationController?.navigationBar
        // NavigationBarの表示する.
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // NavigationItemの取得する.
        self.navigationItem
        // タイトルを設定する.
        self.navigationItem.title = "DinkJJ"
        
        start()
        
    }
    
    
    func start(){
        // ボタンを生成する.
        nextButton.frame = CGRectMake(0, 0, screenRotationWidth/2, screenRotationHeight/10)
        nextButton.backgroundColor = UIColor.redColor();
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("ドリンクを作る", forState: .Normal)
        
        nextButton.layer.cornerRadius = 20.0
        nextButton.alpha = 0.8
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height/1.5)
        nextButton.addTarget(self, action: "moveClickNextButton", forControlEvents: .TouchDown)
        nextButton.addTarget(self, action: "onClickNextButton", forControlEvents: .TouchUpInside)
        nextButton.addTarget(self, action: "outClickNextButton", forControlEvents: .TouchUpOutside)
        // ボタンを追加する.
        self.view.addSubview(nextButton);
        
    }
    
    //ボタンを押している状態の処理
    func moveClickNextButton(){
        //self.nextButton.backgroundColor = UIColor.blackColor()
        self.nextButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    
    //ボタンの領域内で指を離したときの処理
    func onClickNextButton(){
        
        /*
        // 遷移するViewを定義する.
        // Viewを移動する.
        */
        let genreSelectViewController: UIViewController = GenreSelectViewController()
        self.navigationController?.pushViewController(genreSelectViewController, animated: false)
        
        nextButton.backgroundColor = UIColor.redColor();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
