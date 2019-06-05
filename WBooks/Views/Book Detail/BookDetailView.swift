//
//  BookDetail.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 03/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookDetailView: UIView, NibLoadable {
    
    @IBOutlet weak var detailTable: UITableView!
    
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel! {
        didSet {
            lblStatus.textColor = UIColor(red: 0.82, green: 0.01, blue: 0.11, alpha: 1)
        }
    }
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var imgBookCover: UIImageView!
    
    @IBOutlet weak var lblAdd: UILabel! {
        didSet {
            lblAdd.textColor = UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1)
            lblAdd.layer.cornerRadius = lblAdd.layer.frame.height/2
            lblAdd.layer.borderWidth = 1
            lblAdd.layer.backgroundColor = (UIColor.white).cgColor
            lblAdd.layer.borderColor = UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1).cgColor
        }
    }
    
    @IBOutlet weak var lblRent: UILabel! {
        didSet {
            lblRent.textColor = UIColor.white
            lblRent.layer.cornerRadius = lblRent.layer.frame.height/2
            lblRent.layer.backgroundColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1).cgColor
        }
    }
    
}
