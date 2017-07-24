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
    
    let userImages: [String: UIImage] = [
        "Captain Kirk": #imageLiteral(resourceName: "captain_kirk"),
        "Dr. McCoy": #imageLiteral(resourceName: "dr_mccoy"),
        "Scotty": #imageLiteral(resourceName: "scotty"),
        "Spock": #imageLiteral(resourceName: "spock"),
        "Uhura": #imageLiteral(resourceName: "uhura")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileImage()
    }
    
    @IBOutlet weak var profileImage: CircleImage!
    
    func setProfileImage() {
        if let userImage = userImages[(CURRENT_USER?.name)!] {
            print("set image!")
            profileImage.image = userImage
        } else {
            print("name not found")
            profileImage.image = UIImage.init(named: "new_user")
        }
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        logOut()
    }
    
    func logOut() {
        UsersService.logoutUser(session_token: (CURRENT_USER?.sessionToken)!, completion: {
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
