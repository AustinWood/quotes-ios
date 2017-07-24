//
//  QuotesService.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct QuotesService {
    
//    static func getAllQuotes() {
//        getQuotes(said_by: nil, heard_by: nil, said_by_or_heard_by: USER_ID)
//    }
//    
//    static func getAllSaidQuotes() {
//        getQuotes(said_by: USER_ID, heard_by: nil, said_by_or_heard_by: nil)
//    }
//    
//    static func getAllHeardQuotes() {
//        getQuotes(said_by: nil, heard_by: USER_ID, said_by_or_heard_by: nil)
//    }
//    
//    static func getQuotes(said_by: Int) {
//        getQuotes(said_by: said_by, heard_by: USER_ID, said_by_or_heard_by: nil)
//    }
//    
//    static func getQuotes(said_by: Int?, heard_by: Int?, said_by_or_heard_by: Int?) {
//        fetchQuotes(said_by: said_by, heard_by: heard_by, said_by_or_heard_by: said_by_or_heard_by,
//                    completion: { [] (result: Result<[Quote]>) in
//                        
//                        switch(result) {
//                        case let .success(fetchedQuotes):
//                            print(fetchedQuotes)
//                        case let .failure(error):
//                            print(error.localizedDescription)
//                        }
//        })
//    }
    
    static func fetchQuotes(said_by: Int?, heard_by: Int?, said_by_or_heard_by: Int?,
                          completion: @escaping (Result<[Quote]>) -> ()) {
        
        Alamofire
            .request(Router.fetchQuotes(said_by: said_by, heard_by: heard_by, said_by_or_heard_by: said_by_or_heard_by))
            .responseJSON(completionHandler: { response in
                
                switch(response.result) {
                    
                case let .success(value):
                    let json = JSON(value:value)
                    var quotes: [Quote] = []
                    
                    if let jsonQuotes = json.array {
                        for jsonQuote in jsonQuotes {
                            if let quote = Quote(json: jsonQuote) {
                                quotes.append(quote)
                            } else {
                                print("error parsing quote JSON")
                            }
                        }
                    }
                    
                    return completion(Result.success(quotes))
                    
                case let .failure(error):
                    print(error)
                }
            })
    }
    
}
