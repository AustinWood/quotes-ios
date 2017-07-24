//
//  QuotesVC.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

///////////////////////////////
// TODO
//
// tableViewBeginUpdates/endUpdates for smooth reloading
// loading spinner
//
///////////////////////////////

import UIKit
import Alamofire
import SwiftyJSON

class QuotesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuotes()
        configureTableView()
    }
    
    func getQuotes() {
        QuotesService.fetchQuotes(said_by: nil, heard_by: nil, said_by_or_heard_by: CURRENT_USER?.id,
                    completion: { [] (result: Result<[Quote]>) in
                        
                        switch(result) {
                        case let .success(fetchedQuotes):
                            self.quotes = fetchedQuotes
                            self.tableView.reloadData()
                        case let .failure(error):
                            print(error.localizedDescription)
                        }
        })
    }
    
    //////////////////////////////////////////////
    // MARK: - Table view
    
    @IBOutlet weak var tableView: UITableView!
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QuoteCell
        cell.configureCell(quote: quotes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
}
