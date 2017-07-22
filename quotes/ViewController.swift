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
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createNewUserOld()
        createNewUser()
    }
    
    func createNewUserOld() {
        print(">>> createNewUserOld")
        
        let urlEndpoint = "https://quotes-ios.herokuapp.com/v1/users"
        
        let parameters: Parameters = ["user": [
            "phone_number": 1324567897,
            "name": "Greg Bobby",
            "password": "password"
        ]]
        
        Alamofire.request(urlEndpoint, method: .post, parameters: parameters).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
    func createNewUser() {
        print(">>> createNewUser")
        
        Service.createUser(phone_number: 1234567896, name: "Keith Wood", password: "password", image_url: nil,
                           completion: { [weak self] (result: Result<User>) in
                            
                            switch(result) {
                            case let .success(user):
                                self?.user = user
                                print(user)
                            case let .failure(error):
                                print(error.localizedDescription)
                            }
        })
    }
}
