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
        getQuotes()
    }
    
    func getQuotes() {
        let url = "https://quotes-ios.herokuapp.com/v1/quotes"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON(completionHandler: { response in
                
                switch(response.result) {
                case let .success(value):
                    let json = JSON(value:value)
                    print(json)
                case let .failure(error):
                    print(error)
                }
            })
    }
    
}
