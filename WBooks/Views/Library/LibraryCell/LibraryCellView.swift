//
//  LibraryCellView.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 20/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class LibraryCellView: UITableViewCell, NibLoadable {
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imageBookCover: UIImageView!
    
    @IBOutlet weak var viewBackgroundContent: UIView! {
        didSet {
            viewBackgroundContent.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewContent: UIView! {
        didSet {
            viewContent.backgroundColor = .clear
        }
    }
}
