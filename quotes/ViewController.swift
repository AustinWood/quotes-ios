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
        createNewUser()
    }
    
    func createNewUser() {
        print(">>> createNewUser")
        
        Service.createUser(phone_number: "1234567896", name: "Keith Wood", password: "password", image_url: nil,
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
