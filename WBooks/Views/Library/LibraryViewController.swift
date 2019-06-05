//
//  LibraryViewController.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 20/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class LibraryViewController: UIViewController {
    
    ///Carga el .xib asociado a la clase LibraryView y se lo asigna a _view.
    private var _view: LibraryView = LibraryView.loadFromNib()!
    private var _viewModel: LibraryViewModel
    private var _bookRepository: BookRepository = BookRepository()
    
    init(viewModel: LibraryViewModel) {
        _viewModel = viewModel
        
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

        _bookRepository.fetchBooks(
            onSuccess: { [weak self] books in
                self?._viewModel.books = books.map { BookViewModel(book: $0) }
                self?._view.libraryTable?.reloadData()
            }, onError: { error in
                print(error)
            })
    }
}

//Implementaciones que Table View me exige.
extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    //Numero de filas.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.books.count
    }
    
    //La funcion exige un return value de tipo UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //.dequeue me devuelve una celda reutilizable (Las celdas en el telefono desaparecen y reaparecen segun como se encuentre la vista de la tabla)
        let cell = tableView.dequeue(cell: LibraryCellView.self)!
        let book = _viewModel.books[indexPath.row]
        cell.lblBookTitle.text = book.title
        cell.lblAuthor.text = book.author
        setNavigationBarItems()
        let imageUrl = URL(string: book.image)
        let data = try? Data(contentsOf: imageUrl ?? "http://wolox-training.s3.amazonaws.com/uploads/6942334-M.jpg")
        if let imageData = data {
            let bookImage = UIImage(data: imageData)
            cell.imageBookCover.image = bookImage
        }
        return cell
    }
    
    //Cuando se seleccione alguna de las columas, redirigir de vista.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Guarda el book instance del libro de la fila seleccionada.
        let book = _viewModel.books[indexPath.row]
        //********let bookDetailViewModel = BookDetailViewModel(bookVM: book)
        //********let bookDetailViewController = BookDetailViewController(viewModel: bookDetailViewModel)
        //********let bookDetailViewController = BookDetailViewController(viewModel: book)
        let bookDetailViewController = BookDetailViewController(bookVM: book)
        // Cambia de controlador actual.
        navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
    
    func setNavigationBarItems() {
        //UIImage "named" part is thejust the name of the image as a String and without the need of the extension.
        let notificationsButton = UIBarButtonItem(image: UIImage(named: "ic_notifications"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action))
        let searchButton = UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action))
        /*Las propiedades de Navigation Item son modificadas desde la instancia child del UINavigationController
         porque cuando NavigationController muestra el child, usa la referncia Navigation Item es del child*/
        notificationsButton.tintColor = UIColor.white
        searchButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = notificationsButton
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.title = "LIBRARY"
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "ic_back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
}
