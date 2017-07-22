//
//  ViewController.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createNewUser()
    }
    
    func createNewUser() {
        print(">>> createNewUser")
        
        let urlEndpoint = "https://quotes-ios.herokuapp.com/v1/users"
        
        let parameters: Parameters = ["user": [
            "phone_number": 1324567892,
            "name": "Greg Bobby",
            "password": "password"
        ]]
        
        Alamofire.request(urlEndpoint, method: .post, parameters: parameters).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
}
