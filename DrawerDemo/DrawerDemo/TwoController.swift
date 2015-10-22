//
//  TwoController.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/22.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

class TwoController: UIViewController {
    weak var delegate: OnewControllerDelegate?
    @IBAction func settingBtnClick(sender: AnyObject) {
        delegate?.changePosition()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
