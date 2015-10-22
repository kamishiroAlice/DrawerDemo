//
//  ViewController.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/22.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,OnewControllerDelegate{

    //tabbar控制器
    lazy var tabbarVC:UITabBarController = {
        return  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabbarVC") as! UITabBarController
        }()
    
    //tabbar子控制器1
    lazy var oneVC:OnewController = {
        let nav = self.tabbarVC.childViewControllers[0] as! UINavigationController
        return nav.topViewController as! OnewController
        }()
    //tabbar子控制器2
    lazy var twoVC:TwoController = {
        let nav = self.tabbarVC.childViewControllers[1] as! UINavigationController
        return nav.topViewController as! TwoController
        }()
    
    //SettingView
    lazy var leftView:UIView = {
        var leftView =  UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        leftView.backgroundColor = UIColor.redColor()
        let btn1 = UIButton(type: UIButtonType.ContactAdd)
        btn1.frame = CGRectMake(20, 20, 50, 50)
        btn1.tag = 1001
        let btn2 = UIButton(type: UIButtonType.ContactAdd)
        btn2.frame = CGRectMake(20, 100, 50, 50)
        btn2.tag = 1002
        leftView.addSubview(btn1)
        leftView.addSubview(btn2)
        btn1.addTarget(self, action: "changeVC:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.addTarget(self, action: "changeVC:", forControlEvents: UIControlEvents.TouchUpInside)
        return leftView
        }()
    
    //左边两个按钮的监听方法
    func changeVC(sender:UIButton){
        let selectVCNum = sender.tag - 1001
        self.tabbarVC.selectedIndex = selectVCNum
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.tabbarVC.view.transform = CGAffineTransformMakeTranslation(350, 0)
            }) { (_) -> Void in
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.tabbarVC.view.transform = CGAffineTransformIdentity
            })
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oneVC.delegate = self
        twoVC.delegate = self
        self.tabbarVC.selectedIndex = 0
        if let _ = self.tabbarVC.selectedViewController {
            self.view.addSubview(leftView)
            self.view.addSubview(tabbarVC.view)
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //代理方法,移动tabbar子控制的View
    func changePosition() {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.tabbarVC.view.transform = CGAffineTransformMakeTranslation(300, 0)
        })
        
    }
    
    


}

