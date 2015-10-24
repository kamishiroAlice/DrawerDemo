//
//  TypeButton.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/24.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

class TypeButton: UIButton {

    var clicked:Bool = false
    
    var clickedToLoad:Bool = false {
        didSet {
            
            if !clicked {
                setTitle("\(titleLabel?.text)", forState:  UIControlState.Selected)
                setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
                clicked = true
            }else if clicked{
                setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
                clicked = false
            }
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !clicked {
            setTitle("\(titleLabel?.text)", forState:  UIControlState.Selected)
            setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            clicked = true
        }else if clicked{
            setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
            clicked = false
        }
        
        
        
    }
    
    

}
