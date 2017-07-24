//
//  QuoteCell.swift
//  quotes
//
//  Created by Austin Wood on 7/24/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

///////////////////////////////
// TODO
//
// image
// date
// heard by
// heard by attributed text
//
///////////////////////////////

import UIKit

class QuoteCell: UITableViewCell {
    
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var heardByLabel: UILabel!
    
    func configureCell(quote: Quote) {
        
        self.selectionStyle = .none
        
        self.nameLabel.text = quote.saidBy
        self.quoteLabel.text = quote.text
    }
    
}
