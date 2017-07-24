//
//  CircleView.swift
//  quotes
//
//  Created by Austin Wood on 7/24/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.clipsToBounds = true
    }

}
