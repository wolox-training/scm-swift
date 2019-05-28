//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 28/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation

class LibraryViewModel {
    
    public let books: [BookViewModel] = [
        BookViewModel(book: Book(author: "Timothy Cross", title: "A Little Bird Told me")),
        BookViewModel(book: Book(author: "Sofi Oksanen", title: "When The Doves Dissapeared")),
        BookViewModel(book: Book(author: "Peter Sjernstrom", title: "The Best Book in the World")),
        BookViewModel(book: Book(author: "Tony Alcazar", title: "Be Creative")),
        BookViewModel(book: Book(author: "Liliana Castilla", title: "Redesign the Web"))
    ]
    
}
