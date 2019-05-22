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
    
    var booksArray : Array = [["book": "A Little Bird Told me", "author": "Timothy Cross"], ["book" : "When The Doves Dissapeared", "author" : "Sofi Oksanen"],
                              ["book" : "The Best Book in the World", "author" : "Peter Sjernstrom"], ["book" : "Be Creative", "author" : "Tony Alcazar"], ["book" : "Redesign the Web", "author" : "Liliana Castilla"]]
    //UIImage "named" part is thejust the name of the image as a String and without the need of the extension.
    let notificationsButton = UIBarButtonItem(image: UIImage(named: "ic_notifications"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action))
    let searchButton = UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action))

    
    ///Carga el .xib asociado a la clase LibraryView y se lo asigna a _view.
    private var _view: LibraryView = LibraryView.loadFromNib()!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        //No carga nada porque luego a la vista del LibraryViewController le voy a asociar es la vista de LibraryView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Que vista va a mostrar el LibraryViewController
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //A la Table View de la vista LibraryView hay que asignarla como dataSource y delegate (El envia y recibe informacion)
        _view.libraryTable.dataSource = self
        _view.libraryTable.delegate = self
        //Asocia la clase LibraryCellView a la Table View
        _view.libraryTable.register(cell: LibraryCellView.self)
        /*Las propiedades de Navigation Item son modificadas desde la instancia child del UINavigationController
         porque cuando NavigationController muestra el child, usa la referncia Navigation Item es del child*/
        self.navigationItem.leftBarButtonItem = notificationsButton
        self.navigationItem.rightBarButtonItem = searchButton
        self.navigationItem.title = "LIBRARY"
    }
}

//Implementaciones que Table View me exige.
extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    //Numero de filas.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //.dequeue me devuelve una celda reutilizable (Las celdas en el telefono desaparecen y reaparecen segun como se encuentre la vista de la tabla)
        let cell = tableView.dequeue(cell: LibraryCellView.self)!
        //La funcion exige un return value de tipo UITableViewCell
        let dict = booksArray[indexPath.row]
        cell.lblBookTitle.text = dict["book"]
        cell.lblAuthor.text = dict["author"]
        return cell
    }
    
}
