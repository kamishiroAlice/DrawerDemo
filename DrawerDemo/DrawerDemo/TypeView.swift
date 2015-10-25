//
//  TypeView.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/24.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

protocol TypeViewDelegate:NSObjectProtocol{
    func reloadSelectView(titleArr:[AnyObject])
}

class TypeView: UIView {
    
    @IBOutlet weak var selectedBtn1: TypeButton!
    @IBOutlet weak var selectedBtn2: TypeButton!
    @IBOutlet weak var selectedBtn3: TypeButton!
    @IBOutlet weak var selectedBtn4: TypeButton!
    @IBOutlet weak var optionalBtn1: TypeButton!
    @IBOutlet weak var optionalBtn2: TypeButton!
    @IBOutlet weak var optionalBtn3: TypeButton!
    
    weak var delegate: TypeViewDelegate?
    //按钮标题数组
    var btnTitleArr:[AnyObject]? = []
    
    //结束编辑按钮的点击
    @IBAction func endEdit(sender: AnyObject) {
        //重置标题按钮数组
        btnTitleArr = []
        //创建按钮数组
        let btnArray:NSMutableArray = NSMutableArray(array: [selectedBtn1,selectedBtn2,selectedBtn3,selectedBtn4,optionalBtn1,optionalBtn2,optionalBtn3])
        //设置过滤
        let pred = NSPredicate(format: "clicked == true", argumentArray: nil)
        btnArray.filterUsingPredicate(pred)
        //把选中按钮的标题记录
        for btn in btnArray{
            let text = (btn as! TypeButton).titleLabel?.text
            btnTitleArr!.append(text!)
        }
        //刷新分类
        delegate?.reloadSelectView(btnTitleArr!)
        //移除本控件
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.removeFromSuperview()
        }
    }
    
    //MARK: - 根据title数组刷新按钮的状态
    func reloadSelectefTypes(){
        let btnArray:NSMutableArray = NSMutableArray(array: [selectedBtn1,selectedBtn2,selectedBtn3,selectedBtn4,optionalBtn1,optionalBtn2,optionalBtn3])
        
        for typeTitle in btnTitleArr!{
            let type:String = typeTitle as! String
            var flag = false
            for btn in btnArray{
                
                if (btn as! TypeButton).titleLabel?.text == type{
                    if (flag == false){
                        print("\((btn as! TypeButton).titleLabel?.text)")
                        print("\((btn as! TypeButton))")
                        (btn as! TypeButton).setTitle("\(btn.titleLabel?!.text)", forState:  UIControlState.Selected)
                        (btn as! TypeButton).setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
                        (btn as! TypeButton).clicked = true
                        flag = true
                    }
                }
            }
        }
    }
    
}
