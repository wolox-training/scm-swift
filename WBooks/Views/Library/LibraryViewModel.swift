//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 28/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift

class LibraryViewModel {
    
    // Solo escucha el canal de _books pero no me permite modificar a _books
    public var books: Property<[BookViewModel]>
    // Mutable porque debe ser modificable a medida que se van trayendo datos del servidor
    private var _books: MutableProperty<[BookViewModel]> = MutableProperty([])
    private var _bookRepository: BookRepository = BookRepository()
    
    init() {
        // Una vez inicializado, empieza a escuchar a _books
        books = Property(_books)
    }
    
    func getBooks() {
        _bookRepository.fetchBooks(
            onSuccess: { [weak self] books in
                self?._books.value = books.map { BookViewModel(book: $0) }
            }, onError: { error in
                print(error)
        })
    }
    
    func getBook(at index: Int) -> BookViewModel? {
        if 0..<_books.value.count ~= index {
            return _books.value[index]
        }
        return .none
    }
}
