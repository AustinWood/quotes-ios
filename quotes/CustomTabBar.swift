//
//  CustomTabBar.swift
//  quotes
//
//  Created by Austin Wood on 7/24/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    
    override func awakeFromNib() {
        for item in self.items! {
            item.imageInsets = UIEdgeInsetsMake(5.5, 0, -5.5, 0)
        }
    }
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 68
        return sizeThatFits
    }
    
}
