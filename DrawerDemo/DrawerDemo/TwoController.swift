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

}
