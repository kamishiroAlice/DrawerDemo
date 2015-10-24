//
//  BackNavBar.swift
//  OtherTableView
//
//  Created by narcissu on 15/10/24.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

protocol BackNavBarDelegate:NSObjectProtocol{
    func backToPop()
}

class BackNavBar: UIView {
    weak var delegate: BackNavBarDelegate?
    @IBAction func backBtnClick(sender: AnyObject) {
        delegate?.backToPop()
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
