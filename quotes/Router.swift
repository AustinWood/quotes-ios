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
    case fetchQuotes(said_by: Int?, heard_by: Int?, said_by_or_heard_by: Int?)
    
    var path: String {
        switch self {
        case .createUser:
            return NetworkingConstants.users
        case .loginUser:
            return NetworkingConstants.login
        case .logoutUser:
            return NetworkingConstants.logout
        case .fetchQuotes:
            return NetworkingConstants.quotes
        }
    }
    
    // TODO: Is body even necessary?
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
        case let .fetchQuotes(said_by: said_by, heard_by: heard_by, said_by_or_heard_by: said_by_or_heard_by):
            if let said_by = said_by {
                bodyDict["said_by"] = said_by
            }
            if let heard_by = heard_by {
                bodyDict["heard_by"] = heard_by
            }
            if let said_by_or_heard_by = said_by_or_heard_by {
                bodyDict["said_by_or_heard_by"] = said_by_or_heard_by
            }
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
        case let .fetchQuotes(said_by: said_by, heard_by: heard_by, said_by_or_heard_by: said_by_or_heard_by):
            var quoteDict: [String: Any] = [:]
            if let said_by = said_by {
                quoteDict["said_by"] = said_by
            }
            if let heard_by = heard_by {
                quoteDict["heard_by"] = heard_by
            }
            if let said_by_or_heard_by = said_by_or_heard_by {
                quoteDict["said_by_or_heard_by"] = said_by_or_heard_by
            }
            paramDict["quote"] = quoteDict
        }
//        print(paramDict)
        return paramDict
    }
    
    var method: HTTPMethod {
        switch self {
        case .createUser, .loginUser:
            return .post
        case .logoutUser:
            return .delete
        case .fetchQuotes:
            return .get
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
