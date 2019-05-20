//
//  LibraryViewController.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 20/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit

class LibraryViewController: UIViewController {
    
    private var _view: LibraryView = LibraryView.loadFromNib()!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Que vista va a mostrar el controller
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _view.libraryTable.dataSource = self
        _view.libraryTable.delegate = self
        _view.libraryTable.register(cell: LibraryCellView.self)
    }
}

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: LibraryCellView.self)!
        return cell
    }
    
}
