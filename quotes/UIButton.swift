//
//  UIButtonExtensions.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit

extension UIButton {
    func setTitleWithoutAnimation(_ title: String?) {
        UIView.setAnimationsEnabled(false)
        setTitle(title, for: .normal)
        layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
    }
}
