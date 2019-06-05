//
//  BookDetailCell.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 03/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookDetailCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var scrollViewComment: UIScrollView!
    @IBOutlet weak var lblComment: UILabel!
}
