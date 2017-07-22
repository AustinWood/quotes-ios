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
    
//    func getRequest() {
//        print(">>> getRequest")
//        
//        Alamofire.request("https://austinbio.herokuapp.com/api/heart_rates").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//            
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//        }
//    }
    
    func createNewUser() {
        print(">>> createNewUser")
        
        let urlEndpoint = "https://quotes-ios.herokuapp.com/v1/users"
        
        let parameters: Parameters = ["user": [
            "phone_number": 1324567891,
            "name": "Fred Bobby",
            "password": "password"
        ]]
        
        Alamofire.request(urlEndpoint, method: .post, parameters: parameters).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
}
