//
//  Quote.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Quote: Failable {
    
    var id: Int
    var text: String
    var saidBy: String
    var heardBy: [String]
    
    init(id: Int, text: String, saidBy: String, heardBy: [String]) {
        self.id = id
        self.text = text
        self.saidBy = saidBy
        self.heardBy = heardBy
    }
    
    required init?(json: JSON) {
        
        guard
            
            // TODO: Add these strings to QuoteConstants
            let id = json["id"].int,
            let text = json["text"].string,
            let saidBy = json["speaker"]["name"].string,
            let heardBy = json["hearers"].array

            else { return nil }
        
        self.id = id
        self.text = text
        self.saidBy = saidBy
        self.heardBy = heardBy.map { $0.stringValue}
    }
}
