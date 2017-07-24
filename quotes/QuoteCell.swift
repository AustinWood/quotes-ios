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
//
///////////////////////////////

import UIKit

class QuoteCell: UITableViewCell {
    
    let userImages: [String: UIImage] = [
        "Captain Kirk": #imageLiteral(resourceName: "captain_kirk"),
        "Dr. McCoy": #imageLiteral(resourceName: "dr_mccoy"),
        "Scotty": #imageLiteral(resourceName: "scotty"),
        "Spock": #imageLiteral(resourceName: "spock"),
        "Uhura": #imageLiteral(resourceName: "uhura")
    ]
    
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var heardByLabel: UILabel!
    
    func configureCell(quote: Quote) {
        self.selectionStyle = .none
        self.userImage.image = userImages[quote.saidBy]
        self.nameLabel.text = quote.saidBy
        self.dateLabel.text = ""
        self.quoteLabel.text = quote.text
        configureHeardByLabel(names: quote.heardBy)
    }
    
    func configureHeardByLabel(names: [String]) {
        let joinedNames = names.joined(separator: ", ")
        let prefix = "Heard by:"
        let str = "\(prefix) \(joinedNames)"
        let range = (str as NSString).range(of: prefix)
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range: range)
        heardByLabel.attributedText = attributedString
    }
    
}
