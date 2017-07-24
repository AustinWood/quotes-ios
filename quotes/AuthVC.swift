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
// Hide auth switch statements by encapsulating methods in UsersService
// Put SESSION_TOKEN and CURRENT_USER in persistance layer instead of global vars
//
// validate and pretty-format phone number
//
//
///////////////////////////////

var SESSION_TOKEN: String?
var CURRENT_USER: User?

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
    
    //////////////////////////////////////////////
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        setupDismissKeyboard()
    }
    
    func configureTextFields() {
        phoneNumberTextField.keyboardType = .phonePad
        nameTextField.autocapitalizationType = .words
        passwordTextField.isSecureTextEntry = true
    }
    
    func setupDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AuthVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //////////////////////////////////////////////
    // MARK: - Button actions
    
    @IBAction func authButtonPressed(_ sender: Any) {
        dismissKeyboard()
        newAccount ? signUp() : logIn()
    }
    
    @IBAction func toggleAuthTypePressed(_ sender: Any) {
        newAccount = !newAccount
        if newAccount {
            authButton.setTitleWithoutAnimation("Sign up")
            toggleAuthTypeButton.setTitleWithoutAnimation("Log in instead")
            nameStackView.isHidden = false
        } else {
            authButton.setTitleWithoutAnimation("Log in")
            toggleAuthTypeButton.setTitleWithoutAnimation("Sign up instead")
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
        
        UsersService.createUser(phone_number: phoneNumber, name: name, password: password, image_url: nil,
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
        
        UsersService.loginUser(phone_number: phoneNumber, password: password,
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
        SESSION_TOKEN = user?.sessionToken
        CURRENT_USER = user
        self.performSegue(withIdentifier: "goToProfile", sender: self)
    }
    
    //////////////////////////////////////////////
    // MARK: - Demo
    
    @IBAction func captainKirkPressed(_ sender: Any) {
        loginDemoUser(phoneNumber: "7175888802", password: "password")
    }
    
    @IBAction func spockPressed(_ sender: Any) {
        loginDemoUser(phoneNumber: "7175888801", password: "password")
    }
    
    @IBAction func scottyPressed(_ sender: Any) {
        loginDemoUser(phoneNumber: "7175888805", password: "password")
    }
    
    func loginDemoUser(phoneNumber: String, password: String) {
        // TODO: DRY, login()
        UsersService.loginUser(phone_number: phoneNumber, password: password,
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
    
}
