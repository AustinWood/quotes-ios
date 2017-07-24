//
//  CircleButton.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.clipsToBounds = true
    }

}
