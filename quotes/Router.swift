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
    
    case createUser(phone_number: Int, name: String, password: String, image_url: URL?)
    case loginUser(phone_number: Int, password: String)
    
    var path: String {
        switch self {
        case .loginUser:
            return NetworkingConstants.login
        case .createUser:
            return NetworkingConstants.users
        }
    }
    
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
        default:
            print("no action")
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
        default:
            break
        }
        print(paramDict)
        return paramDict
    }
    
    var method: HTTPMethod {
        switch self {
        case .createUser:
            print("post")
            return .post
        default:
            print("get")
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
        
        print(urlRequest)
        
        return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
    }
    
}
