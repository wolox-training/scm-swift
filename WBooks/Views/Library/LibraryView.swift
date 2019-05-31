//
//  LibraryView.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 20/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class LibraryView: UIView, NibLoadable {
    
    @IBOutlet weak var libraryTable: UITableView! {
        didSet {
            let invisionBackground = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1.0)
            libraryTable.layer.backgroundColor = invisionBackground.cgColor
        }
    }
}
