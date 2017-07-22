//
//  Protocols.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol Failable {
    init?(json: JSON)
}
