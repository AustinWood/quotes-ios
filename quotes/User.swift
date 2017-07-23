//
//  User.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class User: Failable {
    
    var id: Int
    var phoneNumber: String
    var name: String
    var imageUrl: URL?
    var image: UIImage?
    var sessionToken: String?
    
    init(id: Int, phoneNumber: String, name: String, imageUrl: URL?, sessionToken: String) {
        self.id = id
        self.phoneNumber = phoneNumber
        self.name = name
        self.imageUrl = imageUrl
        self.sessionToken = sessionToken
    }
    
    required init?(json:JSON) {
        
        guard
            
            let id = json[UserConstants.id].int,
            let phoneNumber = json[UserConstants.phoneNumber].string,
            let name = json[UserConstants.name].string,
            let sessionToken = json[UserConstants.sessionToken].string
        
            else { return nil }
        
        self.id = id
        self.phoneNumber = phoneNumber
        self.name = name
        self.sessionToken = sessionToken
        
        if let urlString = json[UserConstants.imageUrl].string {
            let url = URL(string: urlString)
            self.imageUrl = url
        }
    }
}
