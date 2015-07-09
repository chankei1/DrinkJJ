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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BarButtonItemを作成する.
        //let myBarButton_1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onClickMyBarButton:")
        // NavigationBarを取得する.
        self.navigationController?.navigationBar
        // NavigationBarの表示する.
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // NavigationItemの取得する.
        self.navigationItem
        // タイトルを設定する.
        self.navigationItem.title = "DinkJJ"
        // Barの左側に配置する.
        //self.navigationItem.setLeftBarButtonItem(myBarButton_1, animated: true)
        
        println("bbb")
        
        start()
        
    }
    
    
    func start(){
        // ボタンを生成する.
        let nextButton: UIButton = UIButton(frame: CGRectMake(0, 0, screenRotationWidth/2, screenRotationHeight/10))
        nextButton.backgroundColor = UIColor.redColor();
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("ドリンクを作る", forState: .Normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height/1.5)
        nextButton.addTarget(self, action: "onClickMyButton", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(nextButton);
        
    }
    
    
    func onClickMyButton(){
        
        // 遷移するViewを定義する.
        let genreSelectViewController: UIViewController = GenreSelectViewController()
        
        // Viewを移動する.
        //self.presentViewController(genreSelectViewController, animated: false, completion: nil)
        self.navigationController?.pushViewController(genreSelectViewController, animated: true)
        
    }
    
    /*
    BarButtonイベント
    */
    internal func onClickMyBarButton(sender: UIButton){
        println("onClickMyBarButton:")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
