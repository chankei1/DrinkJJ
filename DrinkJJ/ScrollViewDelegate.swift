//
//  ScrollViewDelegate.swift
//  DrinkJJ
//
//  Created by Keisuke.K on 2015/07/20.
//  Copyright (c) 2015年 Keisuke.K. All rights reserved.
//

protocol ScrollViewDelegate{
    func modalChanged(TouchNumber: Int)
    func touchJudgment(TouchNumber: Int, touchFlg: Bool)
}