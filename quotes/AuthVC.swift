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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var authButton: UIButton!
    
    @IBAction func authButtonPressed(_ sender: Any) {
        logIn()
    }
    
    @IBOutlet weak var toggleAuthTypeButton: UIButton!
    
    @IBAction func toggleAuthTypePressed(_ sender: Any) {
        newAccount = !newAccount
        if newAccount {
            authButton.setTitle("Sign up", for: .normal)
            toggleAuthTypeButton.setTitle("Log in instead", for: .normal)
        } else {
            authButton.setTitle("Log in", for: .normal)
            toggleAuthTypeButton.setTitle("Sign up instead", for: .normal)
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
                            case let .failure(error):
                                print(error.localizedDescription)
                            }
        })
    }
    
}
