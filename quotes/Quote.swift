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
    var heardBy: [Any]
    
    init(id: Int, text: String, saidBy: String, heardBy: [Any]) {
        self.id = id
        self.text = text
        self.saidBy = saidBy
        self.heardBy = heardBy
    }
    
    required init?(json:JSON) {
        
        guard
            
            let id = json[QuoteConstants.id].int,
            let text = json[QuoteConstants.id].string,
            let saidBy = json[QuoteConstants.saidBy].string,
            let heardBy = json[QuoteConstants.heardBy].array

            else { return nil }
        
        self.id = id
        self.text = text
        self.saidBy = saidBy
        self.heardBy = heardBy
    }
}
