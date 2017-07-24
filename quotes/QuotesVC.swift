//
//  QuotesVC.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class QuotesVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuotes()
    }
    
    func getQuotes() {
        QuotesService.fetchQuotes(said_by: nil, heard_by: nil, said_by_or_heard_by: CURRENT_USER?.id,
                    completion: { [] (result: Result<[Quote]>) in
                        
                        switch(result) {
                        case let .success(fetchedQuotes):
                            print(fetchedQuotes)
                        case let .failure(error):
                            print(error.localizedDescription)
                        }
        })
    }
    
}
