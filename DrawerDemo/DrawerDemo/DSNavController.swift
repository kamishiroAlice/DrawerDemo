//
//  DSNavController.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/23.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit
import SnapKit
//导航栏的样式
public enum DSNavStyle : Int {
    case Main
    case Back
}

class DSNavController: UIViewController,BackNavBarDelegate {

    var navStyle:DSNavStyle = DSNavStyle.Main
    //首页样式
    private lazy var navBarView:UIView = {
        var navBarView = UINib(nibName: "MainNavBar", bundle: nil).instantiateWithOwner(self, options: nil).last as! UIView
        return navBarView
    }()
    //返回样式
    private lazy var backBarView:BackNavBar = {
        var backBarView = UINib(nibName: "BackNavBar", bundle: nil).instantiateWithOwner(self, options: nil).last as! BackNavBar
        return backBarView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBarView.delegate = self
        steupUI()
        // Do any additional setup after loading the view.
    }
    
    private func steupUI(){
        self.navigationController?.navigationBarHidden = true
        if navStyle == DSNavStyle.Back {
            self.view.addSubview(backBarView)
            backBarView.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(view.snp_top)
                make.left.equalTo(view.snp_left)
                make.right.equalTo(view.snp_right)
                make.height.equalTo(64)
            }
            return
        }
        self.view.addSubview(navBarView)
        navBarView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp_top)
            make.left.equalTo(view.snp_left)
            make.right.equalTo(view.snp_right)
            make.height.equalTo(64)
        }
    }
    
    func backToPop() {
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
}
