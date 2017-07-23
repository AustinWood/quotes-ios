//
//  Networking.swift
//  quotes
//
//  Created by Austin Wood on 7/22/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case createUser(phone_number: String, name: String, password: String, image_url: URL?)
    case loginUser(phone_number: String, password: String)
    case logoutUser(session_token: String)
    
    var path: String {
        switch self {
        case .createUser:
            return NetworkingConstants.users
        case .loginUser:
            return NetworkingConstants.login
        case .logoutUser:
            return NetworkingConstants.logout
        }
    }
    
    // TODO: Is this even necessary?
    var body: Data {
        var bodyDict: [String: Any] = [:]
        
        switch self {
        case let .createUser(phone_number: phone_number, name: name, password: password, image_url: image_url):
            bodyDict["phone_number"] = phone_number
            bodyDict["name"] = name
            bodyDict["password"] = password
            if let image_url = image_url {
                bodyDict["image_url"] =  image_url
            }
        case let .loginUser(phone_number: phone_number, password: password):
            bodyDict["phone_number"] = phone_number
            bodyDict["password"] = password
        case let .logoutUser(session_token: session_token):
            bodyDict["session_token"] = session_token
        }
        
        let data = try! JSONSerialization.data(withJSONObject: bodyDict, options: [])
        
        return data
    }
    
    var parameters: [String: Any] {
        var paramDict: [String: Any] = [:]
        
        
        switch self {
        case let .createUser(phone_number: phone_number, name: name, password: password, image_url: image_url):
            var userDict: [String: Any] = [:]
            userDict["phone_number"] = phone_number
            userDict["name"] = name
            userDict["password"] = password
            if let image_url = image_url {
                userDict["image_url"] =  image_url
            }
            paramDict["user"] = userDict
        case let .loginUser(phone_number: phone_number, password: password):
            var userDict: [String: Any] = [:]
            userDict["phone_number"] = phone_number
            userDict["password"] = password
            paramDict["user"] = userDict
        case let .logoutUser(session_token: session_token):
            var sessionDict: [String: Any] = [:]
            sessionDict["session_token"] = session_token
            paramDict["session"] = sessionDict
        }
        
        return paramDict
    }
    
    var method: HTTPMethod {
        switch self {
        case .createUser, .loginUser:
            return .post
        case .logoutUser:
            return .delete
        }
    }
    
    var headers: HTTPHeaders {
        let headers: [String:String] = [:]
        switch self {
        default:
            break
        }
        return headers
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkingConstants.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
    }
    
}
