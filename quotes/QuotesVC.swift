//
//  QuotesVC.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class QuotesVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(QuotesService.getAllQuotes())
    }
    
}
