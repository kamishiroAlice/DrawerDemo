//
//  DSNavController.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/23.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit
import SnapKit

public enum DSNavStyle : Int {
    case Main
    case Back
}

class DSNavController: UIViewController,BackNavBarDelegate {

    var navStyle:DSNavStyle = DSNavStyle.Main
    
    private lazy var navBarView:UIView = {
        var navBarView = UINib(nibName: "MainNavBar", bundle: nil).instantiateWithOwner(self, options: nil).last as! UIView
        return navBarView
    }()
    
    private lazy var backBarView:BackNavBar = {
        var backBarView = UINib(nibName: "BackNavBar", bundle: nil).instantiateWithOwner(self, options: nil).last as! BackNavBar
        return backBarView
        }()
    
    override func loadView() {
        super.loadView()
    }
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
