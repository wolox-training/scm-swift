//
//  LibraryCellTableViewCell.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 15/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
class LibraryTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblUsers: UITableView!

    var labelsArray : Array = [["bookTitle" : "A Little Bird Told Me", "author": "Timothy Cross"],
        ["bookTitle" : "When the Doves Disappeared", "author" : "Sofi Oksanen"],
        ["bookTitle" : "The Best Book in the World", "author" : "Peter Sjernstrom"],
        ["bookTitle" : "Be Creative", "author" : "Tony Alcazar"],
        ["bookTitle" : "Redesign the Web", "author" : "Liliana Castilla"]]

    // MARK: - UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelsArray.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath) as! LibraryCell

        let dict = labelsArray[indexPath.row]

        cell.lblbookTtile.text = dict["bookTitle"]
        cell.lblAuthor.text = dict["author"]

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "LibraryCell", bundle: nil)
        self.tblUsers.register(nib, forCellReuseIdentifier: "LibraryCell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
