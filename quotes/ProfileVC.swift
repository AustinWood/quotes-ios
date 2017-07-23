//
//  ProfileVC.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit
import Alamofire

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
//        segueToAuth()
        logOut()
    }
    
    func logOut() {
        
        Service.logoutUser(id: 1, completion: { [weak self] (result: Result<String>) in
            
            switch(result) {
            case let .success(response):
                print(">>> ProfileVC.logOut()")
                print(response)
                self?.segueToAuth()
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
    }
    
    func segueToAuth() {
        self.performSegue(withIdentifier: "goToAuth", sender: self)
    }
}
