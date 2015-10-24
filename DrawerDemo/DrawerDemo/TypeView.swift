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
    var btnTitleArr:[AnyObject]? = []
    
    @IBAction func endEdit(sender: AnyObject) {
        btnTitleArr = []
        var btnArray:NSMutableArray = NSMutableArray(array: [selectedBtn1,selectedBtn2,selectedBtn3,selectedBtn4,optionalBtn1,optionalBtn2,optionalBtn3])
        let pred = NSPredicate(format: "clicked == true", argumentArray: nil)
        btnArray.filterUsingPredicate(pred)
        for btn in btnArray{
            let text = (btn as! TypeButton).titleLabel?.text
            btnTitleArr!.append(text!)
        }
        print("\(btnTitleArr)")
        delegate?.reloadSelectView(btnTitleArr!)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.removeFromSuperview()
        }
    }
    
    func reloadSelectefTypes(){
        var btnArray:NSMutableArray = NSMutableArray(array: [selectedBtn1,selectedBtn2,selectedBtn3,selectedBtn4,optionalBtn1,optionalBtn2,optionalBtn3])
        
        
        for typeTitle in btnTitleArr!{
            let type:String = typeTitle as! String
            print("\(type)")
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
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
