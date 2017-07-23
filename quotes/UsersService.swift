//
//  UsersService.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct UsersService {
    
    static func createUser(phone_number: String, name: String, password: String, image_url: URL?,
                           completion: @escaping (Result<User>) -> Void) {
        
        Alamofire.request(
            Router.createUser(phone_number: phone_number, name: name, password: password, image_url: nil)
            ).responseJSON(completionHandler: { response in
            
            switch(response.result) {
            case let .success(value):
                let json = JSON(value:value)
                if let user = User(json: json) {
                    completion(Result.success(user))
                } else{
                    print("error parsing user JSON")
                }
            case let .failure(error):
                print(error)
            }
        })
    }
    
    static func loginUser(phone_number: String, password: String,
                           completion: @escaping (Result<User>) -> Void) {
        
        Alamofire.request(
            Router.loginUser(phone_number: phone_number, password: password)
            ).responseJSON(completionHandler: { response in
                
                switch(response.result) {
                case let .success(value):
                    let json = JSON(value:value)
                    if let user = User(json: json) {
                        completion(Result.success(user))
                    } else{
                        print("error parsing user JSON")
                    }
                case let .failure(error):
                    print(error)
                }
            })
    }
    
    static func logoutUser(session_token: String, completion: @escaping (Result<Bool>) -> Void) {
        
        Alamofire.request(Router.logoutUser(session_token: session_token))
            .responseJSON(completionHandler: { response in
                
                switch(response.result) {
                case .success:
                    completion(Result.success(true))
                case let .failure(error):
                    print(error)
                }
            })
    }
    
}
