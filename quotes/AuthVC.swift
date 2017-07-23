//
//  SignUpVC.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

///////////////////////////////
// TODO
//
// uncomment logIn() in authButtonPressed
//
// number pad for phone number
// validate and pretty-format phone number
// hide password
// move fields up when keyboard appears (scrollview?)
// autocaps on name
//
//
///////////////////////////////


import UIKit
import Alamofire

class AuthVC: UIViewController {
    
    var user: User?
    var newAccount = true
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameStackView: UIStackView!
    
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var toggleAuthTypeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func authButtonPressed(_ sender: Any) {
        newAccount ? signUp() : logIn()
    }
    
    @IBAction func toggleAuthTypePressed(_ sender: Any) {
        newAccount = !newAccount
        if newAccount {
            authButton.setTitle("Sign up", for: .normal)
            toggleAuthTypeButton.setTitle("Log in instead", for: .normal)
            nameStackView.isHidden = false
        } else {
            authButton.setTitle("Log in", for: .normal)
            toggleAuthTypeButton.setTitle("Sign up instead", for: .normal)
            nameStackView.isHidden = true
        }
    }
    
    //////////////////////////////////////////////
    // MARK: - Auth actions
    
    func signUp() {
        guard
        let phoneNumber = phoneNumberTextField.text,
        let name = nameTextField.text,
        let password = passwordTextField.text
        else { return }
        
        Service.createUser(phone_number: phoneNumber, name: name, password: password, image_url: nil,
                           completion: { [weak self] (result: Result<User>) in
                            
                            switch(result) {
                            case let .success(user):
                                self?.user = user
                                self?.segueToProfile()
                            case let .failure(error):
                                print(error.localizedDescription)
                            }
        })
    }
    
    func logIn() {
        guard
            let phoneNumber = phoneNumberTextField.text,
            let password = passwordTextField.text
            else { return }
        
        Service.loginUser(phone_number: phoneNumber, password: password,
                           completion: { [weak self] (result: Result<User>) in
                            
                            switch(result) {
                            case let .success(user):
                                self?.user = user
                                self?.segueToProfile()
                            case let .failure(error):
                                print(error.localizedDescription)
                            }
        })
    }
    
    func segueToProfile() {
        self.performSegue(withIdentifier: "goToProfile", sender: self)
    }
}
