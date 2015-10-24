//
//  IconButton.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/23.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

class IconButton: UIButton {

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        layer.cornerRadius = rect.width * 0.5
        layer.masksToBounds = true
    }

}
