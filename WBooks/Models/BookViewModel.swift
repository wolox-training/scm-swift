//
//  BookViewModel.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 28/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation

class BookViewModel {
    private let _book: Book
    
    init(book: Book) {
        _book = book
    }
}

extension BookViewModel {
    
//    func getAuthor() -> String {
//        return _book.author
//    }
    
    var author: String {
        return _book.author
    }
    
    var title: String {
        return _book.title
    }
    
    var genre: String {
        return _book.genre
    }
    
    var year: String {
        return _book.year
    }
    
    var image: String {
        return _book.image
    }
    
    var id: Int {
        return _book.id
    }
    
    var status: String {
        return _book.status
    }
}