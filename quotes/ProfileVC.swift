//
//  ProfileVC.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        segueToAuth()
    }
    
    func segueToAuth() {
        self.performSegue(withIdentifier: "goToAuth", sender: self)
    }
}
