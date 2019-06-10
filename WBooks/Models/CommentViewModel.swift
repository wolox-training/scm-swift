//
//  CommentViewModel.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 05/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation

class CommentViewModel {
    private let _comment: Comment
    
    init(comment: Comment) {
        _comment = comment
    }
}

extension CommentViewModel {
    
    var user: User {
        return _comment.user
    }
    
    var id: Int {
        return _comment.id
    }
    
    var book: Book {
        return _comment.book
    }
    
    var content: String {
        return _comment.content
    }
}
