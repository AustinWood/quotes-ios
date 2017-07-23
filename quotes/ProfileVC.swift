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
        logOut()
    }
    
    func logOut() {
        UsersService.logoutUser(session_token: SESSION_TOKEN!, completion: {
            [weak self] (result: Result<Bool>) in
            switch(result) {
            case .success:
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
